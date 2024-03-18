extends TextureButton


signal cut


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Knife


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	(data as Knife).is_finished = true
	(data as Knife).show()
	cut.emit()
