extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite").animation = "normal_run"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var sprite = get_node("AnimatedSprite")
	if Input.is_action_pressed("right"):
		sprite.flip_h = false
		position.x += 1
	if Input.is_action_pressed("left"):
		sprite.flip_h = true
		position.x -= 1
