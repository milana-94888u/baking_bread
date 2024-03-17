extends StageBase


@onready var stages: Array[TextureButton] = [$Mash1, $Mash2, $Mash3, $Out]


func _on_out_pressed() -> void:
	stages[-1].pressed.disconnect(_on_out_pressed)
	stages[-1].hide()
	stages[0].show()
	
