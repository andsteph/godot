extends KinematicBody2D


const LEFT = -1
const RIGHT = 1
var direction = LEFT
var gravity = 100
var speed = 100
var velocity = Vector2.ZERO
var jump_force = 200
var animation = "flying"
var grounded = false
var width = 64
var height = 64


func update_character(delta):
	velocity.y += gravity
	velocity = move_and_slide(velocity,Vector2.UP)
	var sprite = get_node("AnimatedSprite")
	if is_on_floor():
		if velocity.x:
			sprite.animation = "running"
		else:
			sprite.animation = "standing"
	else:
		if velocity.y > 0:
			sprite.animation = "floating"
		else:
			sprite.animation = "flapping"
	if direction == LEFT:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	if position.x < 0:
		position.x = 256
	elif position.x > 256:
		position.x = 0
