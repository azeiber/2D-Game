extends Control

const main_menu = preload("res://mainMenu.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)
