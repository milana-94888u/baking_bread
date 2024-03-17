@tool
extends StageBase


@onready var air_icon := $HeatGraph/AirIcon as Sprite2D
@onready var bellow := $Bellow as TextureButton
@onready var restore_timer := $RestoreTimer as Timer
@onready var progress := $ProgressBar as ProgressBar

@export var bellow_sprites: Array[Texture2D]


@export_range(-1.0, 1.0, 0.05) var heat := 0.0:
	set(value):
		if value < -1.0 or value > 1.0:
			return
		heat = value
		if not is_node_ready():
			await ready
		air_icon.position = Vector2(0, -176) + 276 * Vector2.from_angle(PI * 0.5 - PI * 0.5 * heat * 56.0 / 90.0)
		air_icon.position = Vector2(air_icon.position.x, -air_icon.position.y)
		air_icon.rotation = deg_to_rad(56.0 * heat)


func _ready() -> void:
	bellow.texture_normal = bellow_sprites[0]


func find_current_bellow_progress() -> int:
	for i in bellow_sprites.size():
		if bellow_sprites[i] == bellow.texture_normal:
			return i
	return 0


func _on_bellow_pressed() -> void:
	var current_bellow_progress := find_current_bellow_progress()
	if current_bellow_progress + 1 >= bellow_sprites.size():
		return
	current_bellow_progress += 1
	heat += (bellow_sprites.size() - current_bellow_progress) / float(bellow_sprites.size()) * 0.25
	bellow.texture_normal = bellow_sprites[current_bellow_progress]
	restore_timer.start()


var finished_flag := false


func _process(delta: float) -> void:
	heat -= 0.1 * delta
	if heat >= 0.15 and heat <= 0.35:
		progress.value += 10 * delta
	else:
		progress.value -= delta
	if is_equal_approx(progress.value, progress.max_value):
		if not finished_flag:
			StageManager.switch_to_next_stage()
			finished_flag = true


func _on_restore_timer_timeout() -> void:
	var current_bellow_progress := find_current_bellow_progress()
	if current_bellow_progress <= 0:
		return
	current_bellow_progress -= 1
	bellow.texture_normal = bellow_sprites[current_bellow_progress]
	restore_timer.start()
