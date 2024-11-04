extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 800.0

var distance_traveled: float = 0
var highest_distance: float = 0
var starting_position: Vector2

#@onready var distance_label = $"/root/level1/Node2D/DistanceLabel"
#@onready var highest_distance_label = $"/root/level1/Node2D/HighestDistanceLabel"

@onready var distance_label = get_tree().root.get_node("level1/Node2D/DistanceLabel")
@onready var highest_distance_label = get_tree().root.get_node("level1/Node2D/HighestDistanceLabel")
func _ready():
	starting_position = position
	
func _process(delta):
	distance_traveled = position.x - starting_position.x
	distance_label.text = "Distance: " + str(distance_traveled)
	
	if distance_traveled > highest_distance:
		highest_distance = distance_traveled
		highest_distance_label.text = "Highest Distance: " + str(highest_distance)

func _physics_process(delta: float) -> void:
	# Apply gravity if the character is not on the floor.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jumping if the jump key is pressed and the character is on the floor.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer.play()
		

	# Get horizontal input direction and apply movement.
	var direction := Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		# Gradually stop horizontal movement when no direction is pressed.
		velocity.x = move_toward(velocity.x, 0.0, SPEED * delta)

	# Move the character and handle collisions.
	move_and_slide()
	
func _on_Asteroid_body_entered(body):
	if body.is_in_group("player"): 
		die()

func die():
	get_tree().reload_current_scene()  # Reloads the current scene
