extends Control

const main_level = preload("res://level1.tscn")

func _on_button_pressed() -> void:
	$Button/AudioStreamPlayer.play()
	get_tree().change_scene_to_packed(main_level)
