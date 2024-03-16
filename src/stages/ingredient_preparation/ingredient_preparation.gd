extends StageBase


@export var items_to_check_visibility: Array[CanvasItem]


func _ready() -> void:
	for item in items_to_check_visibility:
		item.visibility_changed.connect(check_completed)


func is_item_visible(item: CanvasItem) -> bool:
	return item.visible


func check_completed() -> void:
	if items_to_check_visibility.all(is_item_visible):
		StageManager.switch_to_next_stage()
