extends Control
const main_level = preload("res://main.tscn")
func _on_button_button_down() -> void:
	get_tree().change_scene_to_packed(main_level)
