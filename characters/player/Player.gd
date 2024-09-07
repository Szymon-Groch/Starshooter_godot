extends Area2D

export (int) var speed = 300

var input_vector = Vector2.ZERO

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") # -1 0 1 | -1 + 1 =0
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up") # -1 0 1 | -1 + 1 =0
	
	global_position.x += input_vector.x * speed * delta 
	global_position.y += input_vector.y * speed * delta 
