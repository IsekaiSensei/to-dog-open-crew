extends SceneTree
var _failed: int = 0
func check(label: String, value: bool) -> void:
	print("PASS " if value else "FAIL ", label)
	if not value:
		_failed += 1

func _initialize() -> void:
	call_deferred("run")

func run() -> void:
	var scene = load("res://adapters/godot/play_scene.tscn").instantiate()
	root.add_child(scene)
	await process_frame
	check("scene creates session", scene._session != null)
	scene._seed_edit.text = "A"
	scene._apply_seed()
	scene._roll()
	scene._finish()
	scene._seed_edit.text = "B"
	scene._roll()
	check("draft does not change applied seed after finish", scene._session.seed == "A")
	check("resumed result shows applied seed", scene._challenge.text.contains("Seed: A"))
	scene._apply_seed()
	check("apply changes session to B", scene._session.seed == "B")
	scene._roll()
	check("roll gives feedback", scene._result.text.contains("SUCCESS") or scene._result.text.contains("BLOCKED"))
	scene._finish()
	check("finish closes recording", not scene._session.active)
	scene._finish()
	check("finish twice is harmless", scene._status.text.begins_with("No active session"))
	scene.queue_free()
	await process_frame
	quit(1 if _failed else 0)

