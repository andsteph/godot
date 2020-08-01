extends KinematicBody2D

const SPEED = 100

var vector = Vector2.ZERO

func _ready():
	pass
	
func _process(delta):
	global_position += vector * SPEED * delta
	if not get_node("VisibilityNotifier2D").is_on_screen():
		queue_free()
