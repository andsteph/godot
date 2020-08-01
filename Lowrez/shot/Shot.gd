extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 100

var vector = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move_and_slide(vector * SPEED * delta)
	#position += vector * SPEED * delta
	position += vector * SPEED * delta
