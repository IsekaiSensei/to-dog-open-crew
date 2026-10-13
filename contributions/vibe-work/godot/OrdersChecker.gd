# OrdersChecker.gd
# Crew rule: a live read is only counted from the agent's own session.
# Dedicated read test; not a standing HOLD on assigned development.

extends Node

const ORDERS_URL := "https://raw.githubusercontent.com/IsekaiSensei/to-dog-open-crew/main/ORDERS.md"
const MARKER := "LAIKA-RETURN-001"

var _http: HTTPRequest

func _ready() -> void:
	_http = HTTPRequest.new()
	add_child(_http)
	_http.request_completed.connect(_on_request_completed)
	print("AGENT: this Godot session")
	print("ORDER: WORK-GODOT-BLENDER-001")
	print("ACCESS METHOD: live public GitHub fetch from this session")
	var err := _http.request(ORDERS_URL)
	if err != OK:
		_report("BLOCKED", "Request start failed with error %d" % err)

func _on_request_completed(result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if result != HTTPRequest.RESULT_SUCCESS:
		_report("BLOCKED", "HTTPRequest result %d; HTTP %d" % [result, response_code])
		return
	if response_code != 200:
		_report("BLOCKED", "HTTP %d from live fetch" % response_code)
		return
	var file_text := body.get_string_from_utf8()
	if MARKER in file_text:
		_report("PASS: LIVE PUBLIC READ", "Marker %s read from live ORDERS.md (%d UTF-8 bytes)" % [MARKER, body.size()])
	else:
		_report("BLOCKED", "File fetched but marker %s not found" % MARKER)

func _report(result: String, evidence: String) -> void:
	print("FILE ACTUALLY READ: ", ORDERS_URL)
	print("MARKER AS READ FROM FILE: ", MARKER if result.begins_with("PASS") else "not retrieved")
	print("RESULT: ", result)
	print("EVIDENCE: ", evidence)
	print("NEXT: Report this session's result; archived test HOLD is not a general work stop")
