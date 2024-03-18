extends Sprite2D

var allow_to_interact: bool = false

func allow_interact() -> void:
	allow_to_interact = true

func _ready():
	# This makes sure the engine sends input events to this node.
	set_process_input(true)

func _input(event):
	if allow_to_interact && event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Change the color of the Sprite2D as an example reaction.
		# This assumes the Sprite2D has a modulate property.
		%Towel.show()
		self.hide()
		get_parent().completed.emit()
