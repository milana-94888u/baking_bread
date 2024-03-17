extends Node


@export var stages: Array[PackedScene]
@export var main_menu: PackedScene

var current_stage := 0


func start_game(starting_from := 0) -> void:
	current_stage = starting_from
	await get_tree().process_frame
	await get_tree().physics_frame
	get_tree().change_scene_to_packed(stages[current_stage])


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_packed(main_menu)


func switch_to_next_stage() -> void:
	print("switching")
	current_stage += 1
	if current_stage < stages.size():
		await get_tree().process_frame
		await get_tree().physics_frame
		get_tree().change_scene_to_packed(stages[current_stage])
