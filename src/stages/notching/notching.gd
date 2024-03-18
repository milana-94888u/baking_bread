extends StageBase


func _on_dough_cut() -> void:
	$Sound.play()
	$Dough.hide()
	$CutDough.show()
	StageManager.switch_to_next_stage()
