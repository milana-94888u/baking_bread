extends Control

# Assuming full progress (100%) corresponds to one full rotation (360 degrees)
const FULL_ROTATION_DEGREES = 360.0

var progress = 0.0 # Progress percentage, from 0.0 to 1.0

func tick(step: float) -> void:
	progress += step
	$Tick.playing = true

func bell() -> void:
	$Bell.playing = true

func wait(seconds: float, progress_step = 0.1, pause_step = 0.5) -> void:
	while seconds - pause_step >= 0:
		self.tick(progress_step)
		seconds -= pause_step
		await get_tree().create_timer(pause_step).timeout 
	
	progress += progress_step
	self.bell()
 
func _process(delta) -> void:
	if progress > 1.0:
		progress -= 1.0 

	var arrow_rotation_degrees = FULL_ROTATION_DEGREES * progress
	$ClockArrow.rotation_degrees = arrow_rotation_degrees

