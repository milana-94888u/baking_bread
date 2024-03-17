extends StageBase

enum {LEFT, RIGHT, NONE}

var last_entered := NONE

var progress := 0.0


@onready var ingredients := $BowlBack/Ingredients as Control
@onready var dough_out := $DoughOut as Sprite2D
@onready var whisk := $Whisk


func increase_progress() -> void:
	progress += 0.1
	ingredients.position.y = lerpf(0, 100, progress)
	dough_out.position.y = lerpf(800, 680, progress)
	if is_equal_approx(progress, 1):
		StageManager.switch_to_next_stage()


func _on_left_area_body_entered(body: Node2D) -> void:
	if body is Whisk and last_entered != LEFT:
		last_entered = LEFT
		$Sound.playing = true
		increase_progress()


func _on_right_area_body_entered(body: Node2D) -> void:
	if body is Whisk and last_entered != RIGHT:
		last_entered = RIGHT
		$Sound.playing = true
		increase_progress()
