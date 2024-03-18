extends Control

signal timeout

@onready var arrow := $ClockArrow as Sprite2D

func tick() -> void:
	$Tick.playing = true

func bell() -> void:
	$Bell.playing = true
	timeout.emit()

func wait(seconds: float, progress_step = 0.1, pause_step = 0.5) -> void:
	($Timer as Timer).start(pause_step)
	var tween := create_tween()
	tween.tween_property(arrow, "rotation_degrees", 0.0, seconds).from(90)
	tween.tween_callback(($Timer as Timer).stop)
	tween.tween_callback(bell)
