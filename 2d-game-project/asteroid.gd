extends Node2D

var speed = 225
var direction = Vector2.ZERO

func _ready():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _process(delta):
	position += direction * speed * delta

	# Check if the asteroid is off-screen
	if position.x < -400 or position.x > get_viewport().size.x + 400 or position.y < -400 or position.y > get_viewport().size.y + 400:
		queue_free()  # Remove the asteroid when it goes off-screen

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"): 
		body.die()
