extends Area2D

export var moveSpeed: float = 120;
var velocity := Vector2(0, 0);





func _physics_process(delta):
	
	# ----- Player Movement -----
	var dirVec := Vector2(0, 0);
	
	if (Input.is_action_pressed("move_left")):
		dirVec.x = -1;
	elif (Input.is_action_pressed("move_right")):
		dirVec.x = 1;
	if (Input.is_action_pressed("move_up")):
		dirVec.y = -1;
	elif (Input.is_action_pressed("move_down")):
		dirVec.y = 1;
	
	velocity = dirVec.normalized() * moveSpeed;
	position += velocity * delta;
