extends RefCounted
# Engine file IO is confined to this adapter.
static func read_json(path: String) -> Dictionary:
	var parser := JSON.new()
	var text: String = FileAccess.get_file_as_string(path)
	if parser.parse(text) != OK or not parser.data is Dictionary:
		push_error("Invalid content: " + path)
		return {}
	return parser.data

static func rules() -> Dictionary:
	var data: Dictionary = read_json("res://shared/rules.json")
	for key in ["schema_version", "ruleset_id", "seed_algorithm", "status",
		"default_seed", "default_object", "approaches", "objects", "reel_symbols", "elements"]:
		if not data.has(key):
			push_error("Rules missing key: " + key)
			return {}
	if int(data["schema_version"]) != 1:
		push_error("Unsupported rules schema")
		return {}
	if not data["objects"].has(data["default_object"]):
		push_error("Default object is missing")
		return {}
	for object in data["objects"].values():
		if int(object["skill_die"]) < 2 or int(object["challenge_die"]) < 2:
			push_error("Dice require at least two sides")
			return {}
	return data

