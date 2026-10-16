# Domain runtime for portable JSON rules. This GDScript implementation
# requires porting for other languages; data and fixtures are shared.
extends RefCounted

const _FNV_OFFSET: int = 2166136261
const _FNV_PRIME: int = 16777619
const _MULBERRY_INC: int = 0x6D2B79F5
const _MASK32: int = 0xFFFFFFFF

var _rules: Dictionary
var _seed_text: String = ""
var _state: int = 0


func _init(rules: Dictionary, seed_text: String) -> void:
	_rules = rules.duplicate(true)
	set_seed(seed_text)


func set_seed(seed_text: String) -> void:
	_seed_text = seed_text
	_state = fnv1a(seed_text)


## FNV-1a 32-bit string hash. Deterministic and engine-version independent,
## so challenge values never depend on Godot's built-in hash behavior.
static func fnv1a(text: String) -> int:
	var h: int = _FNV_OFFSET
	for byte in text.to_utf8_buffer():
		h = ((h ^ byte) * _FNV_PRIME) & _MASK32
	return h


## mulberry32 step. Same seed -> same sequence, every run, every platform.
func _randi() -> int:
	_state = (_state + _MULBERRY_INC) & _MASK32
	var t: int = _state
	t = ((t ^ (t >> 15)) * (t | 1)) & _MASK32
	t = (t ^ (t + (((t ^ (t >> 7)) * (t | 61)) & _MASK32))) & _MASK32
	return (t ^ (t >> 14)) & _MASK32


func _roll(sides: int) -> int:
	return 1 + int(_randi() % sides)


## Fixed challenge value for one object under one seed.
## (Fixed-per-seed+object is a VERIFIED prior-chat note; this formula is PROPOSAL.)
static func challenge_value(seed_text: String, object_id: String, sides: int) -> int:
	return 1 + int(fnv1a(seed_text + "|" + object_id) % sides)


## Three deterministic reel symbols per object.
## (Deterministic derivation is PROPOSAL; the symbol SET itself is OPEN.)
func reel_symbols(seed_text: String, object_id: String) -> Array[String]:
	var symbols: Array = _rules["reel_symbols"]
	var out: Array[String] = []
	for i in 3:
		var idx: int = int(fnv1a(seed_text + "|" + object_id + "|reel|" + str(i)) % symbols.size())
		out.append(symbols[idx])
	return out


## Uninterpreted material-family index 1-4 (PROPOSAL). F1-F4 *meanings* are OPEN
## per RYAN_AI_INTERFACE.txt — this index must not be read as a material table.
static func material_family_index(seed_text: String, object_id: String) -> int:
	return 1 + int(fnv1a(seed_text + "|" + object_id + "|mat") % 4)


## Object challenge dice are independent of World Seed race levels.
func sample_location(object_id: String) -> Dictionary:
	var sides: int = int(_rules["objects"][object_id]["challenge_die"])
	return {
		"object_id": object_id,
		"sides": sides,
		"challenge": challenge_value(_seed_text, object_id, sides),
		"reels": reel_symbols(_seed_text, object_id),
		"material_family_index": material_family_index(_seed_text, object_id),
	}


## Mechanics retained as proposals, configured in shared/rules.json.
## No Nodes, paths, UI, file access, input or clocks in this runtime.
func attempt(object_id: String, approach_id: String) -> Dictionary:
	var object: Dictionary = _rules["objects"][object_id]
	var sides: int = int(object["skill_die"])
	var difficulty: int = challenge_value(_seed_text, object_id, int(object["challenge_die"]))
	var approach: Dictionary = {}
	for entry in _rules["approaches"]:
		if entry["id"] == approach_id:
			approach = entry
	if approach.is_empty():
		return {"error": "unknown_approach"}
	var natural: int = _roll(sides)
	var kept: int = natural
	for index in range(1, int(approach["rolls"])):
		kept = maxi(kept, _roll(sides))
	var challenge: int = maxi(1, difficulty - int(approach["challenge_reduction"]))
	var effective: int = kept + int(approach["bonus"])
	var base_cleared: bool = effective >= challenge
	var bloomed: bool = base_cleared and kept == sides
	if bloomed:
		var extra: int = _roll(sides)
		while extra == sides:
			effective += extra
			extra = _roll(sides)
		effective += extra
	return {
		"seed": _seed_text, "object_id": object_id,
		"ruleset_id": _rules["ruleset_id"],
		"seed_algorithm": _rules["seed_algorithm"],
		"sides": sides, "approach": approach_id,
		"difficulty": difficulty, "challenge": challenge,
		"natural": natural, "kept": kept, "effective": effective,
		"base_cleared": base_cleared, "bloomed": bloomed,
		"success": effective >= challenge,
		"status": _rules["status"]
	}

