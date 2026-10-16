# Automated regression and portable-contract checks. Run with:
# godot --headless --path . --script res://tests/test_foundation.gd
extends SceneTree

# Explicit preload so the demo never depends on the global class cache.
const Detector = preload("../runtime/gdscript/symbol_rules.gd")

const Content = preload("../adapters/godot/load_content.gd")
const WorldRules = preload("../runtime/gdscript/world_rules.gd")
const Session = preload("../runtime/gdscript/session.gd")
var _elements: Dictionary
var _passed := 0
var _failed := 0


func _check(name: String, cond: bool, detail: String = "") -> void:
	if cond:
		_passed += 1
		print("PASS  ", name)
	else:
		_failed += 1
		print("FAIL  ", name, " :: ", detail)


func _cand(tokens: Array, reading: String) -> Variant:
	for c in Detector.derive(tokens):
		if c["reading"] == reading:
			return c["value"]
	return null


func _rejected(d) -> bool:
	for e in d.event_log():
		if e["event"] == "REJECTED":
			return true
	return false


func _initialize() -> void:
	print("AUTOMATED FOUNDATION TESTS — not human PLAYED evidence")
	_elements = Content.rules()["elements"]

	# --- Section 9: typed readings from token streams (value, not identity) ---
	var t42: Array = [Detector.t_face("d6", 4, 4), Detector.t_face("d6", 2, 2)]
	_check("sum: 4+2 -> 6", _cand(t42, "sum") == 6)
	_check("ordered: [4,2] -> 42", _cand(t42, "ordered") == 42)
	_check("sum and ordered coexist (separate readings)",
		_cand(t42, "sum") == 6 and _cand(t42, "ordered") == 42)

	var tdec: Array = [Detector.t_face("d10", 3, 3), Detector.t_dot(),
		Detector.t_face("d10", 1, 1), Detector.t_face("d10", 4, 4)]
	_check("decimal: [3,'.',1,4] -> 3.14", _cand(tdec, "decimal") == 3.14)

	var t44: Array = [Detector.t_face("d6", 4, 4), Detector.t_face("d6", 4, 4)]
	_check("doubles: [4,4]", _cand(t44, "doubles") == 4)
	var t333: Array = [Detector.t_face("d6", 3, 3), Detector.t_face("d6", 3, 3),
		Detector.t_face("d6", 3, 3)]
	_check("triples: [3,3,3]", _cand(t333, "triples") == 3)

	# --- CORRECTIVE: face identity vs numeric value vs label are 3 types ---
	var tok := Detector.t_face("d20", 7, 20, "crit")
	_check("face identity != value != label",
		tok["face"] == "d20.f7" and tok["value"] == 20 and tok["label"] == "crit")
	var tmix: Array = [Detector.t_face("d6", 1, 4, "lucky"), Detector.t_face("d6", 2, 2)]
	_check("derive uses value, never identity or label", _cand(tmix, "sum") == 6)

	# --- element lookup branch (independent of dice patterns) ---
	_check("element 42 -> Mo", Detector.new(_elements).element_lookup(42).get("symbol") == "Mo")
	_check("element 6 -> C", Detector.new(_elements).element_lookup(6).get("symbol") == "C")
	_check("element 69 -> Tm", Detector.new(_elements).element_lookup(69).get("symbol") == "Tm")
	_check("element 79 -> Au", Detector.new(_elements).element_lookup(79).get("symbol") == "Au")
	_check("element 0 -> {} (out of range)", Detector.new(_elements).element_lookup(0).is_empty())
	_check("element 119 -> {} (out of range)", Detector.new(_elements).element_lookup(119).is_empty())
	_check("element 26 honest subset gap",
		Detector.new(_elements).element_lookup(26).get("name") == "unlisted-in-subset")

	# --- CORRECTIVE: scoped contacts with PER-ENDPOINT kinds ---
	var k := Detector.new(_elements)
	k.register_die("d6", 6)
	k.register_die("d8", 8)
	var E := Detector.ContactKind.EDGE
	var F := Detector.ContactKind.FACE
	_check("valid edge-edge contact accepted",
		k.add_contact("d6.f1", E, "d6.f2", E))
	_check("edge-to-face contact accepted with per-endpoint kinds",
		k.add_contact("d6.f1", E, "d8.f1", F))
	_check("unknown face rejected",
		not k.add_contact("d6.f1", E, "d6.f9", E))
	_check("unregistered die rejected",
		not k.add_contact("d6.f1", E, "d20.f1", F))
	_check("bad kind_a rejected",
		not k.add_contact("d6.f1", 99, "d6.f2", E))
	_check("bad kind_b rejected",
		not k.add_contact("d6.f1", E, "d6.f2", -1))
	_check("two contacts recorded", k.contacts().size() == 2)
	var c1: Dictionary = k.contacts()[1]
	_check("per-endpoint kinds stored",
		c1["a"] == "d6.f1" and c1["a_kind"] == "edge"
		and c1["b"] == "d8.f1" and c1["b_kind"] == "face")

	# --- seeded stream repeatability (identity stable per seed) ---
	var a := Detector.seeded_int_stream("TO-DOG-SEED-001", 5, 6)
	var b := Detector.seeded_int_stream("TO-DOG-SEED-001", 5, 6)
	var same := true
	for i in a.size():
		if a[i]["face"] != b[i]["face"] or a[i]["value"] != b[i]["value"]:
			same = false
	_check("same seed -> same faces+values", same)
	var c := Detector.seeded_int_stream("OTHER-SEED", 5, 6)
	var diff := false
	for i in a.size():
		if a[i]["face"] != c[i]["face"]:
			diff = true
	_check("different seed -> different stream (expected)", diff)

	# --- CORRECTIVE: FRAME required before generation or fabrication ---
	var f2 := Detector.new(_elements)
	_check("generate without frame rejected", not f2.generate_note("x"))
	_check("generate_done without frame rejected", not f2.generate_done())
	_check("fabricate without frame rejected",
		not f2.fabricate_box("b", 42, "box", "S"))
	_check("frame accepted after rejections", f2.frame_spawn("S", "s-x"))
	_check("generate accepted once framed", f2.generate_note("x"))

	# --- Section 10: boxes come LAST, enforced by stage guard ---
	var d := Detector.new(_elements)
	_check("frame accepted first", d.frame_spawn("TO-DOG-SEED-001", "spawn-alpha"))
	_check("second frame rejected", not d.frame_spawn("TO-DOG-SEED-001", "spawn-beta"))
	_check("fabrication before GENERATE_DONE rejected",
		not d.fabricate_box("box-early", 42, "box", "TO-DOG-SEED-001"))
	_check("rejections logged as evidence", _rejected(d))
	_check("generate accepted", d.generate_note("placed starter terrain (stub)"))
	_check("generate_done accepted", d.generate_done())
	_check("fabricate box-001 accepted",
		d.fabricate_box("box-001", 42, "box", "TO-DOG-SEED-001"))
	_check("fabricate box-002 accepted",
		d.fabricate_box("box-002", 42, "box", "TO-DOG-SEED-001"))
	_check("generation after fabrication rejected",
		not d.generate_note("late terrain"))
	_check("boxes come last: true for correct order", d.boxes_come_last())
	var ev: Array = []
	for e in d.event_log():
		ev.append("%d:%s" % [e["seq"], e["event"]])
	_check("event log order incl. rejections", ev == [
		"0:FRAME_ESTABLISHED", "1:REJECTED", "2:REJECTED",
		"3:GENERATED", "4:GENERATE_DONE", "5:BOX_FABRICATED",
		"6:BOX_FABRICATED", "7:REJECTED"])

	# --- bottle vs box are independent recipe targets, not number magic ---
	var r := Detector.new(_elements)
	r.frame_spawn("S", "spawn-x")
	r.generate_done()
	r.fabricate_box("vessel-1", 42, "bottle", "S")
	r.fabricate_box("vessel-2", 42, "box", "S")
	var recipes: Array = []
	for e in r.event_log():
		if e["event"] == "BOX_FABRICATED":
			recipes.append(e["detail"])
	_check("bottle and box logged as distinct recipes",
		recipes.size() == 2 and recipes[0] != recipes[1])

	# Same golden results are consumable by future C#/Java implementations.
	var rules: Dictionary = Content.rules()
	var fixture: Dictionary = Content.read_json("res://shared/fixtures.json")
	for case in fixture["cases"]:
		var runtime = WorldRules.new(rules, str(case["seed"]))
		_check("portable UTF-8 hash " + str(case["seed"]),
			WorldRules.fnv1a(str(case["seed"])) == int(case["hash"]))
		for expected in case["attempts"]:
			var actual: Dictionary = runtime.attempt("playtest_door", expected["approach"])
			var equal := true
			for key in expected:
				if actual[key] != expected[key]:
					equal = false
			_check("portable attempt " + str(case["seed"]) + " " + expected["approach"], equal)

	var session = Session.new(rules)
	session.apply_seed(" A ")
	session.roll("brute", "test", 10)
	var report: Dictionary = session.finish()
	_check("applied seed normalized", report["seed"] == "A")
	_check("recorded one result", report["meaningful_choices"] == 1)
	session.roll("knowledge", "test", 20)
	_check("resuming keeps applied seed", session.finish()["seed"] == "A")
	session.apply_seed(" B ")
	_check("apply switches seed", session.seed == "B")
	session.apply_seed("   ")
	_check("empty uses default", session.seed == rules["default_seed"])
	_check("double finish is empty", not session.finish().is_empty() and session.finish().is_empty())
	_check("reject invalid approach", session.roll("invalid", "test", 0).has("error"))
	var harder: Dictionary = rules.duplicate(true)
	harder["objects"]["playtest_door"]["challenge_die"] = 20
	var independent = WorldRules.new(harder, "A")
	_check("challenge die independent of skill die",
		independent.sample_location("playtest_door")["sides"] == 20
		and independent.attempt("playtest_door", "brute")["sides"] == 4)
	var blocked_max_seen := false
	var kept_max_seen := false
	for index in range(200):
		var candidate = WorldRules.new(harder, "BLOOM-" + str(index))
		var outcome: Dictionary = candidate.attempt("playtest_door", "brute")
		if outcome["natural"] == 4 and outcome["challenge"] > 6:
			blocked_max_seen = not outcome["bloomed"] and not outcome["success"]
			break
	for index in range(200):
		var candidate = WorldRules.new(rules, "KEPT-" + str(index))
		var outcome: Dictionary = candidate.attempt("playtest_door", "knowledge")
		if outcome["natural"] < 4 and outcome["kept"] == 4:
			kept_max_seen = outcome["bloomed"] and outcome["success"]
			break
	_check("max roll blocked by challenge cannot Bloom", blocked_max_seen)
	_check("knowledge second kept max can Bloom", kept_max_seen)
	var faces = Detector.new(_elements)
	faces.register_die("d6", 6)
	_check("numeric suffix required", not faces.add_contact("d6.f1x", 0, "d6.f2", 0))

	print("PROOF CASES: %d passed, %d failed" % [_passed, _failed])
	quit(1 if _failed > 0 else 0)

