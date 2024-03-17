extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var buttons: Array[Button] = []
	for button in $HBoxContainer.get_children():
		buttons.append(button as Button)
	for i in len(buttons):
		buttons[i].text = str(i)
		buttons[i].pressed.connect(StageManager.start_game.bind(i))
