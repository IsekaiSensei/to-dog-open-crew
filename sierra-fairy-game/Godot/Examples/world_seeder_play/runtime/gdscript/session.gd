extends RefCounted
# Session rules have no engine paths, input devices, clock or presentation.
const Rules = preload("./world_rules.gd")
var _rules: Dictionary
var _runtime
var seed: String
var active: bool = false
var _events: Array = []

func _init(rules: Dictionary) -> void:
	_rules = rules.duplicate(true)
	apply_seed(str(_rules["default_seed"]))

func apply_seed(draft: String) -> Dictionary:
	var previous: Dictionary = finish()
	seed = draft.strip_edges()
	if seed.is_empty():
		seed = str(_rules["default_seed"])
	_runtime = Rules.new(_rules, seed)
	_events.clear()
	active = true
	return previous

func sample() -> Dictionary:
	return _runtime.sample_location(str(_rules["default_object"]))

func roll(approach: String, input_mode: String, elapsed_ms: int) -> Dictionary:
	if not active:
		_events.clear()
		active = true
	var result: Dictionary = _runtime.attempt(str(_rules["default_object"]), approach)
	if result.has("error"):
		return result
	_events.append({"result": result.duplicate(true),
		"input_mode": input_mode, "elapsed_ms": elapsed_ms})
	return result

func finish() -> Dictionary:
	if not active:
		return {}
	active = false
	return {"test": "PLAY-001", "seed": seed,
		"ruleset_id": _rules["ruleset_id"],
		"seed_algorithm": _rules["seed_algorithm"],
		"status": "RECORDED" if not _events.is_empty() else "NO_GAMEPLAY_EVIDENCE",
		"meaningful_choices": _events.size(), "evidence": _events.duplicate(true)}

