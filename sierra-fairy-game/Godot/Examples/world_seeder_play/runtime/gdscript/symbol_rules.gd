# Pure symbol, contact and world-stage rules. Derived from PR #6.
# Face identity, numeric value and label remain separate.
# FRAME precedes GENERATE; final fabrication follows GENERATE_DONE.
# Prototype mappings remain proposals; reference data is injected.
extends RefCounted

enum TokenKind { INT, DOT, LABEL }
enum OutputKind {
	RAW_ELEMENT,        # atomic-number lookup result (real chemistry ref)
	COMPOUND_MATERIAL,  # recipe-defined material (PROPOSAL)
	COMPONENT,          # manufactured part (PROPOSAL)
	FINISHED_CONTAINER, # bottle/box recipe target (PROPOSAL)
	ORGANIC_RESULT,     # OPEN — meaning not settled
	LORE_REFERENCE      # narrative/legacy code match (PROPOSAL)
}
enum Stage { FRAME, GENERATE, FABRICATE }
enum ContactKind { FACE, EDGE, VERTEX }

# Minimal real-chemistry reference subset. The DATA is real; using it as a
# game mapping is PROPOSAL. Full 1..118 table is OPEN.
var _elements: Dictionary

func _init(elements: Dictionary) -> void:
	_elements = elements.duplicate(true)

var _events: Array[Dictionary] = []
var _seq: int = 0
var _dice: Dictionary = {}        # die_id -> sides (contact scope)
var _contacts: Array[Dictionary] = []
var _generate_done: bool = false
var _entered_fabricate: bool = false
var _frame_done: bool = false


# ---------------------------------------------------------------- tokens ---
# face: identity string, e.g. "d6.f3". value: the number used by arithmetic.
# label: human tag. These are three different types; never interchange them.

static func t_face(die_id: String, face_index: int, value: int, label: String = "") -> Dictionary:
	return {
		"kind": TokenKind.INT,
		"face": "%s.f%d" % [die_id, face_index],
		"value": value,
		"label": label,
	}


static func t_dot() -> Dictionary:
	return {"kind": TokenKind.DOT, "face": "", "value": 0, "label": "."}


static func t_label(text: String) -> Dictionary:
	return {"kind": TokenKind.LABEL, "face": "", "value": 0, "label": text}


# ---------------------------------------------------------------- derive ---
# DERIVE produces SEPARATE candidate readings from one token stream, using
# VALUE only. One roll may mean several things at once; precedence is OPEN.

static func derive(tokens: Array) -> Array:
	var cands: Array = []
	var vals: Array[int] = []
	var has_dot := false
	for t in tokens:
		match t["kind"]:
			TokenKind.INT:
				vals.append(t["value"])
			TokenKind.DOT:
				has_dot = true
	if vals.size() >= 2 and not has_dot:
		var s := 0
		for v in vals:
			s += v
		cands.append({"reading": "sum", "value": s,
			"detail": "arithmetic sum of face values (4+2 -> 6)"})
	if vals.size() >= 2 and not has_dot:
		var digits := ""
		for v in vals:
			digits += str(v)
		cands.append({"reading": "ordered", "value": int(digits),
			"detail": "ordered digit pattern ([4,2] -> 42)"})
	if has_dot:
		var dec := ""
		for t in tokens:
			if t["kind"] == TokenKind.INT:
				dec += str(t["value"])
			elif t["kind"] == TokenKind.DOT:
				dec += "."
		if dec.is_valid_float():
			cands.append({"reading": "decimal", "value": float(dec),
				"detail": "decimal token sequence ([3,'.',1,4] -> 3.14)"})
	if vals.size() == 2 and vals[0] == vals[1]:
		cands.append({"reading": "doubles", "value": vals[0],
			"detail": "matched pair"})
	if vals.size() == 3 and vals[0] == vals[1] and vals[1] == vals[2]:
		cands.append({"reading": "triples", "value": vals[0],
			"detail": "matched triple"})
	return cands


# Element lookup is its OWN reading, independent of dice patterns.
# Returns {} outside 1..118. In-range gaps report honestly (full table OPEN).
func element_lookup(atomic_no: int) -> Dictionary:
	if atomic_no < 1 or atomic_no > 118:
		return {}
	if _elements.has(str(atomic_no)):
		var e: Dictionary = _elements[str(atomic_no)]
		return {"atomic_no": atomic_no, "symbol": e["symbol"], "name": e["name"]}
	return {"atomic_no": atomic_no, "symbol": "?",
		"name": "unlisted-in-subset"}


# --------------------------------------------------------------- contacts --
# Scoped geometric contacts: which faces touch, and how — PER ENDPOINT.
# An edge-to-face contact records kind_a=edge, kind_b=face. Faces must
# belong to a registered die; anything else is rejected, not guessed.

func register_die(die_id: String, sides: int) -> void:
	_dice[die_id] = sides


static func _kind_name(kind: int) -> String:
	return ["face", "edge", "vertex"][clampi(kind, 0, 2)]


func add_contact(face_a: String, kind_a: int, face_b: String, kind_b: int) -> bool:
	if kind_a < ContactKind.FACE or kind_a > ContactKind.VERTEX:
		return false
	if kind_b < ContactKind.FACE or kind_b > ContactKind.VERTEX:
		return false
	if not _face_known(face_a) or not _face_known(face_b):
		return false
	_contacts.append({
		"a": face_a, "a_kind": _kind_name(kind_a),
		"b": face_b, "b_kind": _kind_name(kind_b),
	})
	return true


func contacts() -> Array[Dictionary]:
	return _contacts.duplicate(true)


func _face_known(face: String) -> bool:
	var parts := face.split(".")
	if parts.size() != 2:
		return false
	if not _dice.has(parts[0]):
		return false
	if not parts[1].begins_with("f"):
		return false
	var index_text: String = parts[1].substr(1)
	if not index_text.is_valid_int():
		return false
	var idx := int(index_text)
	return idx >= 1 and idx <= int(_dice[parts[0]])


# ------------------------------------------------------- world stages -----
# Section 10 order of operations, ENFORCED: FRAME -> GENERATE -> FABRICATE.
# Invalid transitions return false and log a REJECTED event as evidence.

func frame_spawn(seed_text: String, spawn_id: String) -> bool:
	# Rejected calls may already have produced evidence events. They do
	# not establish a frame; guard successful state rather than log length.
	if _frame_done:
		_reject("FRAME_ESTABLISHED", "world frame is already established")
		return false
	_frame_done = true
	_log(Stage.FRAME, "FRAME_ESTABLISHED",
		"seed=%s spawn=%s (fairy frame step; exact machinery OPEN)" % [seed_text, spawn_id])
	return true


func generate_note(detail: String) -> bool:
	if not _frame_done:
		_reject("GENERATED", "world frame must be established first")
		return false
	if _entered_fabricate:
		_reject("GENERATED", "generation after final fabrication is not allowed")
		return false
	_log(Stage.GENERATE, "GENERATED", detail)
	return true


func generate_done() -> bool:
	if not _frame_done:
		_reject("GENERATE_DONE", "world frame must be established first")
		return false
	if _entered_fabricate:
		_reject("GENERATE_DONE", "generation after final fabrication is not allowed")
		return false
	_generate_done = true
	_log(Stage.GENERATE, "GENERATE_DONE",
		"world-generation pass complete (stub; full generation OPEN)")
	return true


func fabricate_box(box_id: String, element_no: int, recipe: String, seed_text: String) -> bool:
	if not _frame_done or not _generate_done:
		_reject("BOX_FABRICATED", "fabrication requires FRAME then GENERATE_DONE")
		return false
	_entered_fabricate = true
	var el := element_lookup(element_no)
	_log(Stage.FABRICATE, "BOX_FABRICATED",
		"box=%s material=%s(%d) recipe=%s seed=%s" % [
			box_id, el.get("symbol", "?"), element_no, recipe, seed_text])
	return true


func boxes_come_last() -> bool:
	var gen_done_seq := -1
	for e in _events:
		if e["event"] == "GENERATE_DONE":
			gen_done_seq = e["seq"]
	if gen_done_seq < 0:
		return false
	for e in _events:
		if e["stage"] == Stage.FABRICATE and e["seq"] < gen_done_seq:
			return false
	return true


func event_log() -> Array[Dictionary]:
	return _events.duplicate(true)


func _log(stage: int, event: String, detail: String) -> void:
	_events.append({"seq": _seq, "stage": stage, "event": event, "detail": detail})
	_seq += 1


func _reject(event: String, reason: String) -> void:
	_events.append({"seq": _seq, "stage": -1, "event": "REJECTED",
		"detail": "%s refused: %s" % [event, reason]})
	_seq += 1


# ------------------------------------------------- seeded token stream ----
# Minimal deterministic stream for repeatability tests (FNV-1a + mulberry32).

static func _fnv1a(s: String) -> int:
	var h := 0x811C9DC5
	for b in s.to_utf8_buffer():
		h ^= b
		h = (h * 0x01000193) & 0xFFFFFFFF
	return h


static func _mulberry32(state: int) -> Array:
	var s := (state + 0x6D2B79F5) & 0xFFFFFFFF
	var t := s
	t = ((t ^ (t >> 15)) * (t | 1)) & 0xFFFFFFFF
	t ^= t + (((t ^ (t >> 7)) * (t | 61)) & 0xFFFFFFFF)
	t = (t ^ (t >> 14)) & 0xFFFFFFFF
	return [t, s]


static func seeded_int_stream(seed_text: String, count: int, sides: int) -> Array:
	var tokens: Array = []
	var die_id := "d%d" % sides
	var h := _fnv1a(seed_text)
	for i in count:
		var r := _mulberry32(h)
		h = r[1]
		var v := 1 + int(r[0]) % sides
		tokens.append(t_face(die_id, v, v))
	return tokens


