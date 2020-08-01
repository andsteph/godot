extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 100
const SHOT_SCENE = preload("res://shot/Shot.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var motion = Vector2.ZERO
	var sprite = get_node("AnimatedSprite")
	
	if Input.is_action_pressed("up") and Input.is_action_pressed("down") == false:
		motion.y = -SPEED
	elif Input.is_action_pressed("down") and Input.is_action_pressed("up") == false:
		motion.y = SPEED
	
	if Input.is_action_pressed("left") and Input.is_action_pressed("right") == false:
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and Input.is_action_pressed("left") == false:
		motion.x = SPEED
	
	if motion == Vector2.ZERO:
		sprite.animation = "idle"
	else:
		sprite.animation = "move"
	move_and_slide(motion)
	
	if Input.is_action_just_pressed("shoot"):
		var shot_scene = SHOT_SCENE.instance()
		get_tree().root.add_child(shot_scene)
		shot_scene.vector = position.direction_to(get_global_mouse_position()).normalized()
		shot_scene.position = self.duplicate().position
			
	look_at(get_global_mouse_position())
