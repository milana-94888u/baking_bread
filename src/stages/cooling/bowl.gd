extends TextureButton


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Towel


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	(data as Towel).result_sprite.show()
