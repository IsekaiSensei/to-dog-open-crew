extends Node3D
## TO DOG: VR First Contact. Standalone proof-of-concept, not the frozen game.
## Units are meters; it supports room-scale XR and a keyboard/mouse test fallback.

const DOG_POS := Vector3(-0.23, 0.0, -1.35)
const FAIRY_POS := Vector3(0.34, 1.28, -1.23)
const INTERACT_LAYER := 2

var xr_live := false
var has_fuse := false
var repaired := false
var fairy_visible := true
var xr_origin: XROrigin3D
var xr_camera: XRCamera3D
var desktop_camera: Camera3D
var controllers: Array[XRController3D] = []
var triggers_down: Array[bool] = [false, false]
var fuse_pickup: StaticBody3D
var fuse_visual: Node3D
var socket_body: StaticBody3D
var socket_indicator: MeshInstance3D
var fairy: Node3D
var fairy_wings: Array[Node3D] = []
var status_label: Label3D
var cue_label: Label3D
var fairy_sound: AudioStreamPlayer3D
var simulation_time := 0.0


func _ready() -> void:
	_build_world()
	_build_players()
	_update_status()
	_start_xr_or_desktop()


func _start_xr_or_desktop() -> void:
	var xr: XRInterface = XRServer.find_interface("OpenXR")
	if xr != null:
		if xr.is_initialized() or xr.initialize():
			xr_live = true
			get_viewport().use_xr = true
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
			desktop_camera.current = false
			xr_camera.current = true
	if not xr_live:
		get_viewport().use_xr = false
		desktop_camera.current = true
		print("TO DOG VR: no active XR runtime; desktop preview enabled.")


func _build_players() -> void:
	xr_origin = XROrigin3D.new()
	xr_origin.name = "XR_Origin"
	add_child(xr_origin)
	xr_camera = XRCamera3D.new()
	xr_camera.name = "Angel_XR_Camera"
	xr_origin.add_child(xr_camera)
	for i in range(2):
		var controller := XRController3D.new()
		controller.name = "Left_Controller" if i == 0 else "Right_Controller"
		controller.tracker = "left_hand" if i == 0 else "right_hand"
		controller.pose = "aim"
		xr_origin.add_child(controller)
		controllers.append(controller)
		var cursor := MeshInstance3D.new()
		cursor.name = "Laser"
		var beam := CylinderMesh.new()
		beam.top_radius = 0.0018
		beam.bottom_radius = 0.0018
		beam.height = 2.0
		cursor.mesh = beam
		cursor.material_override = _mat(Color(0.25, 0.7, 1.0, 0.45), true)
		cursor.position.z = -1.0
		controller.add_child(cursor)
		var ray := RayCast3D.new()
		ray.name = "RepairRay"
		ray.collision_mask = INTERACT_LAYER
		ray.target_position = Vector3(0.0, 0.0, -3.0)
		controller.add_child(ray)
		_mball(controller, Vector3(0.0, -0.015, -0.05), Vector3(0.03, 0.03, 0.04), Color(0.6, 0.66, 0.77), false)

	desktop_camera = Camera3D.new()
	desktop_camera.name = "Desktop_Preview_Camera"
	desktop_camera.position = Vector3(0.05, 1.55, 0.48)
	desktop_camera.look_at(Vector3(-0.05, 0.65, -1.35), Vector3.UP)
	desktop_camera.fov = 65.0
	add_child(desktop_camera)


func _build_world() -> void:
	var env_node := WorldEnvironment.new()
	var env := Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.045, 0.061, 0.095)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.65, 0.72, 0.9)
	env.ambient_light_energy = 0.55
	env_node.environment = env
	add_child(env_node)
	var lamp := DirectionalLight3D.new()
	lamp.rotation_degrees = Vector3(-45.0, 25.0, 0.0)
	lamp.light_energy = 1.0
	add_child(lamp)
	var floor_body := StaticBody3D.new()
	floor_body.name = "Workshop_Floor"
	add_child(floor_body)
	_box(floor_body, Vector3(0, -0.025, -1.0), Vector3(4.0, 0.05, 4.0), Color(0.13, 0.17, 0.23), false)
	var shape := CollisionShape3D.new()
	var floor_shape := BoxShape3D.new()
	floor_shape.size = Vector3(4.0, 0.05, 4.0)
	shape.shape = floor_shape
	shape.position = Vector3(0.0, -0.025, -1.0)
	floor_body.add_child(shape)
	for i in range(-4, 5):
		_box(self, Vector3(float(i) * 0.4, 0.001, -1.0), Vector3(0.003, 0.002, 4.0), Color(0.19, 0.23, 0.31), true)
		_box(self, Vector3(0, 0.001, -1.0 + float(i) * 0.4), Vector3(4.0, 0.002, 0.003), Color(0.19, 0.23, 0.31), true)
	_build_dog()
	_build_fuse()
	_build_fairy()


func _build_dog() -> void:
	var dog := Node3D.new()
	dog.name = "DOG_40cm_Placeholder"
	dog.position = DOG_POS
	add_child(dog)
	var shell := Color(0.82, 0.68, 0.48)
	var accent := Color(0.31, 0.35, 0.40)
	_box(dog, Vector3(0, 0.215, 0), Vector3(0.22, 0.18, 0.28), shell, false)
	_box(dog, Vector3(0, 0.34, -0.15), Vector3(0.215, 0.13, 0.14), shell, false)
	_box(dog, Vector3(0, 0.295, -0.235), Vector3(0.13, 0.066, 0.08), accent, false)
	_box(dog, Vector3(0, 0.365, -0.227), Vector3(0.175, 0.07, 0.008), Color(0.02, 0.04, 0.07), true)
	for x in [-0.054, 0.054]:
		_mball(dog, Vector3(x, 0.367, -0.236), Vector3(0.026, 0.013, 0.008), Color(0.12, 0.72, 1.0), true)
		_box(dog, Vector3(x * 1.65, 0.413, -0.15), Vector3(0.065, 0.07, 0.07), shell, false)
	for x in [-0.09, 0.09]:
		for z in [-0.095, 0.10]:
			_box(dog, Vector3(x, 0.108, z), Vector3(0.065, 0.18, 0.064), shell, false)
			_box(dog, Vector3(x, 0.023, z - 0.01), Vector3(0.082, 0.046, 0.085), accent, false)
	_box(dog, Vector3(0, 0.335, 0.065), Vector3(0.18, 0.095, 0.13), accent, false)
	_box(dog, Vector3(0.0, 0.405, 0.085), Vector3(0.14, 0.05, 0.11), Color(0.54, 0.36, 0.22), false)
	_box(dog, Vector3(0, 0.236, -0.143), Vector3(0.10, 0.014, 0.013), Color(0.28, 0.7, 1.0), true)
	var socket := StaticBody3D.new()
	socket.name = "RepairSocket"
	socket.collision_layer = INTERACT_LAYER
	socket.collision_mask = 0
	socket.position = Vector3(0.0, 0.268, -0.153)
	dog.add_child(socket)
	var collision := CollisionShape3D.new()
	var shape := SphereShape3D.new()
	shape.radius = 0.11
	collision.shape = shape
	socket.add_child(collision)
	socket_body = socket
	socket_indicator = _mball(socket, Vector3.ZERO, Vector3(0.044, 0.044, 0.025), Color(0.24, 0.58, 1.0), true)
	var title := _label(dog, "DOG  /  40 cm", Vector3(0.0, 0.52, 0.08), Color(0.84, 0.85, 0.95), 28)
	title.billboard = BaseMaterial3D.BILLBOARD_ENABLED


func _build_fuse() -> void:
	var tray := Node3D.new()
	tray.name = "Salvage_Tray"
	tray.position = Vector3(0.35, 0.0, -0.85)
	add_child(tray)
	_box(tray, Vector3(0, 0.045, 0), Vector3(0.25, 0.09, 0.18), Color(0.26, 0.31, 0.37), false)
	fuse_pickup = StaticBody3D.new()
	fuse_pickup.name = "FusePickup"
	fuse_pickup.position = Vector3(0, 0.13, 0)
	fuse_pickup.collision_layer = INTERACT_LAYER
	fuse_pickup.collision_mask = 0
	tray.add_child(fuse_pickup)
	var collider := CollisionShape3D.new()
	var shape := SphereShape3D.new()
	shape.radius = 0.085
	collider.shape = shape
	fuse_pickup.add_child(collider)
	fuse_visual = Node3D.new()
	fuse_pickup.add_child(fuse_visual)
	_box(fuse_visual, Vector3.ZERO, Vector3(0.07, 0.115, 0.055), Color(0.7, 0.57, 0.29), false)
	_box(fuse_visual, Vector3(0.0, 0.0, -0.03), Vector3(0.04, 0.055, 0.012), Color(0.2, 0.64, 0.96), true)
	_label(tray, "FUSE", Vector3(0.0, 0.265, 0), Color(0.8, 0.82, 0.97), 24)


func _build_fairy() -> void:
	fairy = Node3D.new()
	fairy.name = "Silver_Shadow_Fairy_10cm"
	fairy.position = FAIRY_POS
	add_child(fairy)
	var core := MeshInstance3D.new()
	core.name = "Faceted_Power_Core"
	var sphere := SphereMesh.new()
	sphere.radius = 0.028
	sphere.height = 0.065
	sphere.radial_segments = 6
	sphere.rings = 3
	core.mesh = sphere
	core.material_override = _mat(Color(0.3, 0.32, 1.0), true)
	fairy.add_child(core)
	for side in [-1.0, 1.0]:
		for level in [-1.0, 1.0]:
			var wing := Node3D.new()
			wing.name = "THR_Wing"
			wing.position = Vector3(side * 0.02, level * 0.014, 0)
			fairy.add_child(wing)
			fairy_wings.append(wing)
			var endpoint := Vector3(side * 0.067, level * 0.044, 0.006)
			var triangle := _triangle_mesh(Vector3.ZERO, Vector3(side * 0.035, level * 0.05, 0), endpoint)
			var mesh := MeshInstance3D.new()
			mesh.mesh = triangle
			mesh.material_override = _mat(Color(0.38, 0.54, 1.0, 0.66), true)
			wing.add_child(mesh)
			_mball(wing, endpoint, Vector3(0.006, 0.006, 0.006), Color(1.0, 0.72, 0.35), true)
	_mball(fairy, Vector3(0, 0.047, 0), Vector3(0.007, 0.02, 0.007), Color(1, 0.68, 0.25), true)
	_mball(fairy, Vector3(0, -0.042, 0), Vector3(0.010, 0.018, 0.010), Color(1, 0.68, 0.25), true)
	_label(fairy, "SILVER SHADOW", Vector3(0.0, 0.13, 0), Color(0.74, 0.77, 1.0), 20)
	fairy_sound = AudioStreamPlayer3D.new()
	fairy_sound.stream = _make_ting()
	fairy_sound.unit_size = 1.0
	fairy.add_child(fairy_sound)


func _process(delta: float) -> void:
	simulation_time += delta
	if fairy_visible:
		fairy.position = FAIRY_POS + Vector3(0.0, sin(simulation_time * 2.0) * 0.015, 0.0)
		for i in range(fairy_wings.size()):
			fairy_wings[i].rotation_degrees.y = sin(simulation_time * 15.0 + float(i) * PI) * 13.0
	if not xr_live:
		return
	for i in range(controllers.size()):
		var hand := controllers[i]
		var down := hand.is_button_pressed("trigger_click") or hand.get_float("trigger") > 0.75
		if down and not triggers_down[i]:
			var ray := hand.get_node("RepairRay") as RayCast3D
			ray.force_raycast_update()
			if ray.is_colliding():
				_interact(ray.get_collider())
		triggers_down[i] = down


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()
		elif event.keycode == KEY_F:
			if has_fuse:
				_interact(socket_body)
			else:
				_interact(fuse_pickup)
		elif event.keycode == KEY_X:
			fairy_visible = not fairy_visible
			fairy.visible = fairy_visible
			_update_status()
	if not xr_live and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var origin := desktop_camera.project_ray_origin(event.position)
		var dir := desktop_camera.project_ray_normal(event.position)
		var query := PhysicsRayQueryParameters3D.create(origin, origin + dir * 6.0, INTERACT_LAYER)
		var hit := get_world_3d().direct_space_state.intersect_ray(query)
		if not hit.is_empty():
			_interact(hit["collider"])


func _interact(target: Object) -> void:
	if target == fuse_pickup and not has_fuse and not repaired:
		has_fuse = true
		fuse_visual.visible = false
		fuse_pickup.collision_layer = 0
		_play_ting()
	elif target == socket_body and has_fuse and not repaired:
		repaired = true
		has_fuse = false
		socket_indicator.material_override = _mat(Color(1.0, 0.72, 0.28), true)
		_play_ting()
	else:
		return
	_update_status()


func _update_status() -> void:
	if status_label == null:
		status_label = _label(self, "", Vector3(0.0, 1.05, -1.75), Color(0.95, 0.92, 0.7), 26)
		status_label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	if cue_label == null:
		cue_label = _label(self, "", Vector3(0.0, 0.91, -1.75), Color(0.75, 0.85, 1.0), 18)
		cue_label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	if repaired:
		status_label.text = "DOG POWER: RESTORED"
		cue_label.text = "First repair complete. Crew returns together."
	elif has_fuse:
		status_label.text = "FUSE RECOVERED"
		cue_label.text = "Point at DOG's blue chest socket; press trigger."
	else:
		status_label.text = "DOG POWER: OFFLINE"
		cue_label.text = "Point at the fuse in the tray; press trigger."
	if not fairy_visible:
		cue_label.text += "  (Fairy hidden)"


func _play_ting() -> void:
	if fairy_visible and fairy_sound != null:
		fairy_sound.play()


func _mat(color: Color, light: bool) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	if color.a < 1.0:
		material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	if light:
		material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		material.emission_enabled = true
		material.emission = Color(color.r, color.g, color.b)
		material.emission_energy_multiplier = 0.75
	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	return material


func _box(parent: Node3D, pos: Vector3, size: Vector3, color: Color, glow: bool) -> MeshInstance3D:
	var mesh := MeshInstance3D.new()
	var cube := BoxMesh.new()
	cube.size = size
	mesh.mesh = cube
	mesh.material_override = _mat(color, glow)
	mesh.position = pos
	parent.add_child(mesh)
	return mesh


func _mball(parent: Node3D, pos: Vector3, scale_size: Vector3, color: Color, glow: bool) -> MeshInstance3D:
	var mesh := MeshInstance3D.new()
	var sphere := SphereMesh.new()
	sphere.radius = 0.5
	sphere.height = 1.0
	sphere.radial_segments = 8
	sphere.rings = 4
	mesh.mesh = sphere
	mesh.scale = scale_size * 2.0
	mesh.material_override = _mat(color, glow)
	mesh.position = pos
	parent.add_child(mesh)
	return mesh


func _triangle_mesh(a: Vector3, b: Vector3, c: Vector3) -> ArrayMesh:
	var verts := PackedVector3Array([a, b, c])
	var arrays := []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = verts
	var result := ArrayMesh.new()
	result.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	return result


func _label(parent: Node3D, value: String, pos: Vector3, color: Color, size: int) -> Label3D:
	var result := Label3D.new()
	result.text = value
	result.position = pos
	result.modulate = color
	result.font_size = size
	result.pixel_size = 0.0012
	result.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	parent.add_child(result)
	return result


func _make_ting() -> AudioStreamWAV:
	const SAMPLE_RATE := 22050
	const DURATION := 0.22
	var count := int(SAMPLE_RATE * DURATION)
	var bytes := PackedByteArray()
	bytes.resize(count * 2)
	for i in range(count):
		var t := float(i) / float(SAMPLE_RATE)
		var envelope := pow(1.0 - t / DURATION, 3.0)
		var wave := sin(TAU * 880.0 * t) * 0.7 + sin(TAU * 1320.0 * t) * 0.3
		var sample := int(clampf(wave * envelope * 11500.0, -32768.0, 32767.0))
		bytes.encode_s16(i * 2, sample)
	var wav := AudioStreamWAV.new()
	wav.format = AudioStreamWAV.FORMAT_16_BITS
	wav.mix_rate = SAMPLE_RATE
	wav.stereo = false
	wav.data = bytes
	return wav
