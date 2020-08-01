extends "res://Characters/Character.gd"


func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right') and Input.is_action_pressed("left") == false:
		velocity.x = 1 * speed
		direction = RIGHT
	elif Input.is_action_pressed('left') and Input.is_action_pressed("right") == false:
		velocity.x = -1 * speed
		direction = LEFT
	if Input.is_action_pressed("flap"):
		velocity.y = -1 * jump_force
	

func _physics_process(delta):
	get_input()
	update_character(delta)
	
