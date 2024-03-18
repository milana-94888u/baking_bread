extends StageBase


@onready var sfx := $ShovelSound as AudioStreamPlayer

var is_moving := false

var finished_flag := false

@onready var shovel := $Shovel as TextureButton


func _on_shovel_button_down() -> void:
	is_moving = true


func _on_shovel_button_up() -> void:
	is_moving = false


func _process(delta: float) -> void:
	if finished_flag:
		sfx.stop()
		return
	if not is_moving:
		sfx.stop()
		return
	if get_global_mouse_position().x >= shovel.position.x + shovel.size.x:
		sfx.stop()
		return
	if !sfx.playing:
		sfx.play()
	shovel.position.x -= 200 * delta
	shovel.position.x = maxf(shovel.position.x, 400)
	if shovel.position.x < 401:
		finished_flag = true
		StageManager.switch_to_next_stage()
