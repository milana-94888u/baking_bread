extends TextureButton


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Ingredient


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	get_node((data as Ingredient).result_ingredient).show()
