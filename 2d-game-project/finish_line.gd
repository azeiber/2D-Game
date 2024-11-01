extends Node2D

const victory_scene = preload("res://victoryscene.tscn")

func _on_Area2D_body_entered(body):
	print("Body entered:", body.name)
	get_tree().change_scene_to_packed(victory_scene)  # Change to the next scene


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Body entered:", body.name)
	get_tree().change_scene_to_packed(victory_scene) 
	 # Replace with function body.
