extends Node2D

const victory_scene = preload("res://victoryscene.tscn")

func _on_Area2D_body_entered(body):
	print("Body entered:", body.name)
	get_tree().change_scene_to_packed(victory_scene)  # Change to the next scene
