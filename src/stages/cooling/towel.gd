extends TextureButton
class_name Towel
signal dragged

@export var result_sprite: NodePath

@export var grabbed_texture: Texture2D

var waiting_flag := false


func _get_drag_data(_at_position: Vector2) -> Variant:
	set_drag_preview(make_drag_preview())
	$Touch.playing = true
	hide()
	waiting_flag = true
	return self


func make_drag_preview() -> TextureRect:
	var t := TextureRect.new()
	t.texture = grabbed_texture
	t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	t.custom_minimum_size = size
	var c := Control.new()
	c.add_child.call_deferred(t)
	t.position = -0.5 * t.texture.get_size()
	return c

func _notification(what: int) -> void:
	if what != NOTIFICATION_DRAG_END:
		return
	if waiting_flag:
		visible = !is_drag_successful()
		$Touch.playing = true
		if is_drag_successful():
			dragged.emit()
	waiting_flag = false
