extends StageBase


@onready var stages: Array[TextureButton] = [$Mash1, $Mash2, $Mash3, $Out]


func _on_out_pressed() -> void:
	stages[-1].pressed.disconnect(_on_out_pressed)
	stages[-1].hide()
	stages[0].show()
	


func _on_mash_1_pressed() -> void:
	stages[0].hide()
	stages[1].show()


func _on_mash_2_pressed() -> void:
	stages[1].hide()
	stages[2].show()


func _on_mash_3_pressed() -> void:
	stages[2].hide()
	stages[3].show()
	StageManager.switch_to_next_stage()
