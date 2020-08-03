extends KinematicBody2D


const SPEED = 50
const SHOT_SCENE = preload("res://shot/Shot.tscn")

var motion = Vector2.ZERO
var keys = {
	"RedGate" : false,
	"GreenGate" : false,
	"BlueGate" : false
}


func _process(delta):
	get_input()
	look_at(get_global_mouse_position())
	update_camera()
	var collision = move_and_collide(motion.normalized()*SPEED*delta)
	gate_check(collision)


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
	var camera = get_node("Camera2D")
	camera.rotation_degrees = rotation_degrees


func gate_check(collision):
	if collision:
		var collider = collision.get_collider()
		var collider_name = collider.get_name()
		if collider_name == "RedGate" or collider_name == "GreenGate" or collider_name == "BlueGate":
			if keys[collider_name]:
				collider.queue_free()
		else:
			print(collider)


func item_grabbed(item):
	var node_name = item.get_name()
	item.queue_free()
	if node_name == 'RedKey':
		keys['RedGate'] = true
	elif node_name == 'GreenKey':
		keys['GreenGate'] = true
	elif node_name == 'GreenKey':
		keys['GreenGate'] = true
