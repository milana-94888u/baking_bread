extends Node


@export var stages: Array[PackedScene]

var current_stage := 0


func _ready() -> void:
	start_game()


func start_game() -> void:
	current_stage = 0
	await get_tree().process_frame
	await get_tree().physics_frame
	get_tree().change_scene_to_packed(stages[current_stage])


func switch_to_next_stage() -> void:
	print("switching")
	current_stage += 1
	if current_stage < stages.size():
		await get_tree().process_frame
		await get_tree().physics_frame
		get_tree().change_scene_to_packed(stages[current_stage])
