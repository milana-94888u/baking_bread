extends CharacterBody2D
class_name Whisk


var is_moving := false


func _on_whisk_sprite_button_down() -> void:
	is_moving = true


func _on_whisk_sprite_button_up() -> void:
	is_moving = false


func _physics_process(_delta: float) -> void:
	if not is_moving:
		return
	velocity = (get_global_mouse_position() - global_position) * 5
	move_and_slide()
