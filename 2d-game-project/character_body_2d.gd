extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 800.0

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
