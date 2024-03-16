extends StageBase


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_node(self)
	

func process_node(node: Node) -> void:
	if not is_node_ready():
		await ready
	for child in node.get_children():
		process_node(child)
	if node is TextureButton:
		set_click_mask(node)
	return
	if node is Sprite2D:
		replace_sprite(node)


func set_click_mask(button: TextureButton) -> void:
	var bitmap := BitMap.new()
	bitmap.create_from_image_alpha(button.texture_normal.get_image())
	button.texture_click_mask = bitmap
	print(button.texture_click_mask)


func replace_sprite(initial: Sprite2D) -> void:
	var button := TextureButton.new()
	button.texture_normal = initial.texture
	button.position = initial.position - initial.get_rect().size * 0.5 * initial.scale
	button.name = initial.name
	button.scale = initial.scale
	initial.replace_by(button)
