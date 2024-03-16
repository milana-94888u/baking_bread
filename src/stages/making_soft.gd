extends StageBase


@onready var dough_line := $Line2D as Line2D
var points: Array[Vector2]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dough_line.width_curve
	for i in range(500, 1500, 8):
		points.append(Vector2(i, 748))
	dough_line.points = points


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		return
	var mouse_position := get_local_mouse_position()
	dough_line.points[-1] = mouse_position
