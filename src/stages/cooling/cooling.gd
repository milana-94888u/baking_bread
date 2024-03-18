extends StageBase



func _on_towel_dragged():
	$Clock.wait(5.0)
	await $Clock.timeout
	$DoughWithTowel.allow_interact();


func _on_dough_with_towel_completed() -> void:
	$DoughWithTowel.hide()
	$DoughRaised.show()
	StageManager.switch_to_next_stage()
