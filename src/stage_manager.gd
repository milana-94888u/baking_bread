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
	print("switching stage from %s [%d] to %s [%d]"
	 % [ stages[current_stage].resource_path, current_stage, 
	stages[current_stage+1].resource_path, current_stage+1 ] )
	current_stage += 1
	if current_stage < stages.size():
		await get_tree().process_frame
		await get_tree().physics_frame
		get_tree().change_scene_to_packed(stages[current_stage])
