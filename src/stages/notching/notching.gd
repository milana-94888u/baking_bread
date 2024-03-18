extends StageBase


func _on_dough_cut() -> void:
	$Dough.hide()
	$CutDough.show()
	StageManager.switch_to_next_stage()
