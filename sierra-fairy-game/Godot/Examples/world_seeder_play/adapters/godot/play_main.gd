extends Control
const Content = preload("./load_content.gd")
const Session = preload("../../runtime/gdscript/session.gd")
var _session
var _rules: Dictionary
var _seed_edit: LineEdit
var _approach: OptionButton
var _challenge: Label
var _result: Label
var _status: Label
var _input_mode: String = "unknown"
var _start_ms: int
var _world: Dictionary

func _ready() -> void:
	_rules = Content.rules()
	if _rules.is_empty():
		var error := Label.new()
		error.text = "Content could not load. Check the Godot output."
		add_child(error)
		return
	_world = Content.read_json("res://shared/world_seed.json")
	_session = Session.new(_rules)
	_start_ms = Time.get_ticks_msec()
	_build_ui()
	_refresh()

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		_input_mode = "controller"
	elif event is InputEventKey or event is InputEventMouseButton:
		_input_mode = "keyboard_mouse"

func _label(box: Container, text: String) -> Label:
	var label := Label.new()
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(label)
	return label

func _button(box: Container, text: String, callback: Callable) -> Button:
	var button := Button.new()
	button.text = text
	button.custom_minimum_size.y = 46
	button.pressed.connect(callback)
	box.add_child(button)
	return button

func _build_ui() -> void:
	var margin := MarginContainer.new()
	margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for edge in ["left", "right", "top", "bottom"]:
		margin.add_theme_constant_override("margin_" + edge, 24)
	add_child(margin)
	var scroll := ScrollContainer.new()
	margin.add_child(scroll)
	var box := VBoxContainer.new()
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_theme_constant_override("separation", 12)
	scroll.add_child(box)
	_label(box, "TO DOG — World Seed playtest").add_theme_font_size_override("font_size", 28)
	_status = _label(box, "PLAY-001 | awaiting player choices")
	_label(box, "Choose a seed and approach; roll against one fixed obstruction.")
	_seed_edit = LineEdit.new()
	_seed_edit.text = _session.seed
	_seed_edit.placeholder_text = "World seed"
	_seed_edit.custom_minimum_size.y = 46
	box.add_child(_seed_edit)
	_button(box, "Apply seed", _apply_seed)
	_challenge = _label(box, "")
	_approach = OptionButton.new()
	_approach.custom_minimum_size.y = 46
	for entry in _rules["approaches"]:
		_approach.add_item(str(entry["label"]))
	box.add_child(_approach)
	var roll_button := _button(box, "ROLL", _roll)
	_result = _label(box, "Pick an approach and roll.")
	_button(box, "Finish session", _finish)
	_label(box, "World Seed level %d: %s\n%s\nWorld Seed race levels do not set the challenge die here." % [int(_world["world_seed_level"]), str(_world["levels"][0]["races"]), str(_world["levels"][1]["note"])])
	_label(box, "Draft seed edits take effect only after Apply seed. Tab / arrows or controller focus navigate; Enter / A activates.")
	roll_button.grab_focus()

func _refresh() -> void:
	var sample: Dictionary = _session.sample()
	_challenge.text = "Seed: %s\nObject: %s   Fixed difficulty: %d   Challenge die: d%d" % [
		_session.seed, sample["object_id"], sample["challenge"], sample["sides"]]

func _apply_seed() -> void:
	_publish(_session.apply_seed(_seed_edit.text))
	_seed_edit.text = _session.seed
	_start_ms = Time.get_ticks_msec()
	_refresh()
	_result.text = "Seed applied. Choose an approach."
	_status.text = "PLAY-001 | awaiting player choices"

func _roll() -> void:
	var approach: String = str(_rules["approaches"][_approach.selected]["id"])
	if not _session.active:
		_start_ms = Time.get_ticks_msec()
	var result: Dictionary = _session.roll(approach, _input_mode, Time.get_ticks_msec() - _start_ms)
	_result.text = "Approach: %s\nNatural: %d   Kept: %d   Total: %d\nEffective challenge: %d   Bloom: %s\n%s" % [
		approach, result["natural"], result["kept"], result["effective"],
		result["challenge"], "yes" if result["bloomed"] else "no",
		"SUCCESS" if result["success"] else "BLOCKED"]
	_status.text = "PLAY-001 | recording choices"

func _finish() -> void:
	var report: Dictionary = _session.finish()
	if report.is_empty():
		_status.text = "No active session. Roll resumes the applied seed."
	else:
		_publish(report)
		_status.text = "Session recorded; evidence is in the output. Player review still required."

func _publish(report: Dictionary) -> void:
	if report.is_empty():
		return
	report["capture"] = "automated" if DisplayServer.get_name() == "headless" else "interactive_unreviewed"
	print("PLAY-001 EVIDENCE ", JSON.stringify(report))

