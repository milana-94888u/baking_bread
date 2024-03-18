extends StageBase



func _on_towel_dragged():
	$Clock.wait(3.0)
	$DoughWithTowel.allow_interact();
