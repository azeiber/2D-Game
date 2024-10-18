extends CharacterBody2D

@export var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 200)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		position.x += speed;
	if Input.is_action_just_pressed("ui_left"):
		position.x -= speed;
