extends Node2D
## Spark: First Path — standalone Godot 4 mini-game, no external assets.
## Status: implementation draft; runtime playtest required.
const W := 960.0
const H := 600.0
const GOAL := 8
const SPEED := 285.0
const PLAYER_R := 15.0
const GEM_R := 12.0
const COLORS := [Color("#3ce4df"), Color("#bb7dff"), Color("#ffb75b"), Color("#ff65bf")]
var player := Vector2(480, 300)
var gems: Array[Vector2] = []
var foes: Array[Dictionary] = []
var sparks: Array[Dictionary] = []
var collected := 0
var lives := 3
var phase := "menu"
var elapsed := 0.0
var invuln := 0.0
var spawn_timer := 0.0
var rng := RandomNumberGenerator.new()
var ui: Label
var help: Label
var title: Label
var overlay: ColorRect
var buttons: VBoxContainer

func _ready() -> void:
	rng.randomize()
	_build_ui()
	_show_menu()

func _build_ui() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)
	ui = Label.new()
	ui.position = Vector2(20, 16)
	ui.add_theme_font_size_override("font_size", 21)
	layer.add_child(ui)
	help = Label.new()
	help.position = Vector2(20, H - 35)
	help.text = "MOVE: WASD / ARROWS    DASH: SPACE    PAUSE: P    RESTART: R"
	help.add_theme_font_size_override("font_size", 15)
	layer.add_child(help)
	overlay = ColorRect.new()
	overlay.color = Color(0.015, 0.025, 0.08, 0.88)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	layer.add_child(overlay)
	var center := CenterContainer.new()
	center.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.add_child(center)
	buttons = VBoxContainer.new()
	buttons.alignment = BoxContainer.ALIGNMENT_CENTER
	buttons.add_theme_constant_override("separation", 22)
	center.add_child(buttons)
	title = Label.new()
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 38)
	buttons.add_child(title)
	var play := Button.new()
	play.text = "PLAY / RESTART"
	play.custom_minimum_size = Vector2(260, 55)
	play.pressed.connect(_new_game)
	buttons.add_child(play)
	var detail := Label.new()
	detail.text = "Collect 8 living gems. Dodge the drifting shards.\nReturn to the central Nexus when the gate awakens."
	detail.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	buttons.add_child(detail)

func _show_menu() -> void:
	phase = "menu"
	title.text = "SPARK: FIRST PATH"
	overlay.visible = true
	queue_redraw()

func _new_game() -> void:
	player = Vector2(W / 2.0, H / 2.0)
	collected = 0
	lives = 3
	elapsed = 0.0
	invuln = 1.0
	spawn_timer = 0.0
	gems.clear()
	foes.clear()
	sparks.clear()
	for i in range(6):
		_add_gem()
	for i in range(3):
		_add_foe()
	phase = "play"
	overlay.visible = false
	queue_redraw()

func _add_gem() -> void:
	for attempt in range(50):
		var p := Vector2(rng.randf_range(55, W - 55), rng.randf_range(80, H - 70))
		if p.distance_to(player) > 100 and p.distance_to(Vector2(W / 2.0, H / 2.0)) > 65:
			gems.append(p)
			return

func _add_foe() -> void:
	var edge := rng.randi_range(0, 3)
	var p := Vector2(rng.randf_range(0, W), rng.randf_range(0, H))
	if edge == 0: p.x = 15
	if edge == 1: p.x = W - 15
	if edge == 2: p.y = 60
	if edge == 3: p.y = H - 55
	var angle := rng.randf_range(0, TAU)
	foes.append({"pos": p, "vel": Vector2.from_angle(angle) * rng.randf_range(70, 135), "angle": angle})

func _process(delta: float) -> void:
	if phase != "play":
		queue_redraw()
		return
	elapsed += delta
	invuln = maxf(0.0, invuln - delta)
	var direction := Vector2.ZERO
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT): direction.x -= 1
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT): direction.x += 1
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP): direction.y -= 1
	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN): direction.y += 1
	var multiplier := 1.7 if Input.is_key_pressed(KEY_SPACE) else 1.0
	player += direction.normalized() * SPEED * multiplier * delta
	player = player.clamp(Vector2(PLAYER_R, 52), Vector2(W - PLAYER_R, H - 50))
	for i in range(gems.size() - 1, -1, -1):
		if player.distance_to(gems[i]) < PLAYER_R + GEM_R:
			gems.remove_at(i)
			collected += 1
			if collected < GOAL: _add_gem()
	for foe in foes:
		var pos: Vector2 = foe["pos"]
		var vel: Vector2 = foe["vel"]
		pos += vel * delta
		if pos.x < 15 or pos.x > W - 15:
			vel.x *= -1
			pos.x = clampf(pos.x, 15, W - 15)
		if pos.y < 55 or pos.y > H - 50:
			vel.y *= -1
			pos.y = clampf(pos.y, 55, H - 50)
		foe["pos"] = pos
		foe["vel"] = vel
		foe["angle"] = float(foe["angle"]) + delta * 2
		if invuln <= 0.0 and player.distance_to(pos) < 27:
			lives -= 1
			invuln = 1.6
			if lives <= 0:
				_finish(false)
				return
	spawn_timer += delta
	if spawn_timer >= 13.0 and foes.size() < 8:
		spawn_timer = 0.0
		_add_foe()
	if collected >= GOAL and player.distance_to(Vector2(W / 2.0, H / 2.0)) < 48:
		_finish(true)
	ui.text = "GEMS  %d / %d     HEARTS  %d     TIME  %ds" % [collected, GOAL, lives, int(elapsed)]
	queue_redraw()

func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_R: _new_game()
		elif event.keycode == KEY_ENTER and phase != "play": _new_game()
		elif event.keycode == KEY_P:
			if phase == "play":
				phase = "pause"
				title.text = "PAUSED"
				overlay.visible = true
			elif phase == "pause":
				phase = "play"
				overlay.visible = false

func _finish(won: bool) -> void:
	phase = "win" if won else "lose"
	title.text = "NEXUS AWAKENED!" if won else "SPARK EXTINGUISHED"
	overlay.visible = true
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(0, 0, W, H), Color("#081329"))
	for x in range(0, 961, 40):
		draw_line(Vector2(x, 0), Vector2(x, H), Color(0.12, 0.28, 0.4, 0.23), 1)
	for y in range(0, 601, 40):
		draw_line(Vector2(0, y), Vector2(W, y), Color(0.12, 0.28, 0.4, 0.23), 1)
	var hub := Vector2(W / 2.0, H / 2.0)
	draw_arc(hub, 44, 0, TAU, 64, Color("#ffc26e") if collected >= GOAL else Color("#375575"), 4)
	draw_arc(hub, 31, 0, TAU, 64, Color("#46f4e6") if collected >= GOAL else Color("#264560"), 2)
	for i in range(gems.size()):
		var p := gems[i]
		var c: Color = COLORS[i % COLORS.size()]
		_draw_gem(p, 12, c)
	for foe in foes:
		var p: Vector2 = foe["pos"]
		var a: float = foe["angle"]
		var points := PackedVector2Array()
		for j in range(6): points.append(p + Vector2.from_angle(a + j * TAU / 6.0) * 18)
		draw_colored_polygon(points, Color("#8c3266"))
		for j in range(6): draw_line(points[j], points[(j + 1) % 6], Color("#ff79bd"), 2)
	if invuln <= 0.0 or int(elapsed * 12) % 2 == 0:
		_draw_gem(player, 17, Color("#55f7ed"))
		draw_arc(player, 22, 0, TAU, 24, Color("#b77cff"), 2)

func _draw_gem(center: Vector2, radius: float, c: Color) -> void:
	var points := PackedVector2Array([center + Vector2(0, -radius), center + Vector2(radius, 0), center + Vector2(0, radius), center + Vector2(-radius, 0)])
	draw_colored_polygon(points, c.darkened(0.42))
	for i in range(4): draw_line(points[i], points[(i + 1) % 4], c, 2.5)
	draw_line(points[0], points[2], c.lightened(0.35), 1)
	draw_line(points[1], points[3], c.lightened(0.35), 1)
	draw_circle(center, 3, Color.WHITE)
