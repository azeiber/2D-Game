extends Control
const tutorial = preload("res://tutorial.tscn")
func _on_button_pressed() -> void:
	$VBoxContainer/Button/AudioStreamPlayer.play()
	get_tree().change_scene_to_packed(tutorial)
