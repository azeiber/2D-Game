extends Node2D

const next_scene = preload("res://victoryscene.tscn")

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):  # Check if the body is the player (optional)
		get_tree().change_scene_to_packed(next_scene)  # Change to the next scene
