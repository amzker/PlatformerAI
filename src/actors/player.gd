extends Actor

export var stomp: = 1000.0

func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left") ,-1 if Input.is_action_just_pressed("jump") and is_on_floor() else 1)

func calc_velocity(linear_velocity: Vector2 ,speed : Vector2, direction: Vector2, is_jump_stopped: bool) -> Vector2:
	var out = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1:
		out.y = speed.y * direction.y
		$jump.play()
	if is_jump_stopped:
		out.y = 0 
	return out

func stompvelo(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out = linear_velocity
	out.y = -impulse
	return out

func _on_enhit_area_entered(area)-> void:
	_velocity = stompvelo(_velocity,stomp)
	$jump.play()

func _on_enhit_body_entered(body)-> void:
	get_tree().change_scene("res://src/levels/game_over.tscn")

func _physics_process(delta: float)-> void:
	for i in get_slide_count():
		var loc = get_slide_collision(i)
		if loc.collider.name == "speedtile":
			speed.x += 2
		elif loc.collider.name == "slowspeed":
			speed.x = speed.x - 5
		elif loc.collider.name == "invertedtile":
			speed.x *= -1
		else:
			pass
	var is_jump_stopped: = Input.is_action_just_released("jump") and _velocity.y < 0
	var direction: = get_direction()
	_velocity = calc_velocity(_velocity,speed,direction, is_jump_stopped)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

	




