extends Node


@export var stages: Array[PackedScene]
@export var main_menu: PackedScene
@export var finish_scene: PackedScene

var current_stage := 0


@onready var lo_effor := $LoEffor as AudioStreamPlayer
@onready var are_you_bready := $AreYouBready as AudioStreamPlayer


func _ready() -> void:
	get_tree().node_added.connect(check_music)
	lo_effor.play()


func check_music(node: Node) -> void:
	if node != get_tree().current_scene:
		return
	if node is StageBase:
		if lo_effor.playing:
			lo_effor.stop()
			are_you_bready.play()
	else:
		if are_you_bready.playing:
			are_you_bready.stop()
			lo_effor.play()


func start_game(starting_from := 0) -> void:
	current_stage = starting_from
	await get_tree().process_frame
	await get_tree().physics_frame
	get_tree().change_scene_to_packed(stages[current_stage])


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_packed(main_menu)


func switch_to_next_stage() -> void:
	current_stage += 1
	if current_stage < stages.size():
		print("switching stage from %s [%d] to %s [%d]"
	 	% [ stages[current_stage - 1].resource_path, current_stage - 1, 
		stages[current_stage].resource_path, current_stage] )
		await get_tree().process_frame
		await get_tree().physics_frame
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed(stages[current_stage])
	else:
		get_tree().change_scene_to_packed(finish_scene)
