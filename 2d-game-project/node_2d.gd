extends Node

var asteroid_scene = preload("res://asteroid.tscn")
var spawn_timer = 1.0  # Time in seconds between spawns
var timer = 0.0

func _process(delta):
	timer += delta
	if timer >= spawn_timer:
		spawn_asteroid()
		timer = 0.0

func spawn_asteroid():
	var asteroid = asteroid_scene.instantiate()
	asteroid.position = Vector2(randf_range(0, 800), randf_range(0, 600))  # Random spawn position
	add_child(asteroid)
