extends TextureButton


func _get_drag_data(at_position: Vector2) -> Variant:
	set_drag_preview(make_drag_preview())
	return self


func _ready() -> void:
	var image := texture_normal.get_image()
	#for x in image.get_width():
		#for y in image.get_height():
			#var color := image.get_pixel(x, y)
			#if not color.is_equal_approx(Color.TRANSPARENT):
				#image.set_pixel(x, y, Color.WHITE)
			#else:
				#image.set_pixel(x, y, Color.TRANSPARENT)
	texture_click_mask = BitMap.new()
	texture_click_mask.create_from_image_alpha(image)


func make_drag_preview() -> TextureRect:
	var t := TextureRect.new()
	t.texture = texture_normal
	#t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	#t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	t.custom_minimum_size = size
	return t
