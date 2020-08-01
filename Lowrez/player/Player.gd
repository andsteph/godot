extends KinematicBody2D

const SPEED = 50
const SHOT_SCENE = preload("res://shot/Shot.tscn")

var motion = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	get_input()
	look_at(get_global_mouse_position())
	update_camera()
	move_and_slide(motion)

func get_input():
	var sprite = get_node("AnimatedSprite")

	motion = Vector2.ZERO
	
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

	if Input.is_action_just_pressed("shoot"):
		var shot_scene = SHOT_SCENE.instance()
		get_tree().root.add_child(shot_scene)
		shot_scene.vector = global_position.direction_to(get_global_mouse_position()).normalized()
		shot_scene.global_position = global_position

func update_camera():
	#var xf = player.gettransform()
	#camera.settransform(xf)
	var camera = get_node("Camera2D")
	camera.rotation_degrees = rotation_degrees
