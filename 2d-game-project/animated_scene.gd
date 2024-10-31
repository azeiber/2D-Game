extends Node2D

@onready var anim = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#anim.play("Run")
	#anim.play("Jump")
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		anim.play("Jump")
	elif !anim.is_playing(): #or anim.animation == "Jump":
		anim.play("Run")
	
