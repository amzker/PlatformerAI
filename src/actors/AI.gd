extends Actor

export var stomp: = 1000.0

signal death 
var raycasters = []
var num_casts = 8
var sight_range = 1000
var startposition = 0
var endposition = 0
var rightst = 0
var leftst = 0
var jumpp: bool = false
var stime
var etime = 0
func _ready():
	startposition = self.position.x
	stime = 0
func get_direction(rightst,leftst,jumpp) -> Vector2:
	return Vector2(rightst - leftst , -1 if jumpp and is_on_floor() else 1)

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
	endposition = self.position.x
	#print(endposition)
	emit_signal("death")
	#queue_free()

func _physics_process(delta: float)-> void:
	var is_jump_stopped: = Input.is_action_just_released("jump") and _velocity.y < 0
	var direction: = get_direction(rightst,leftst,jumpp)
	_velocity = calc_velocity(_velocity,speed,direction, is_jump_stopped)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	endposition = self.position.x
	#etime = etime + 1

####ALGORITHM  NEEDS

func sense() -> Array:
		var senses = []
		#FUCK THIS VVARIABLE  SHIT , I AM HARCODING IT 
		$cast1.force_raycast_update()
		if $cast1.is_colliding():
			var collision = $cast1.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)
		$cast3.force_raycast_update()
		if $cast3.is_colliding():
			var collision = $cast3.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)
		$cast2.force_raycast_update()
		if $cast2.is_colliding():
			var collision = $cast2.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)

		$cast4.force_raycast_update()
		if $cast4.is_colliding():
			var collision = $cast4.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)
		$cast5.force_raycast_update()
		if $cast5.is_colliding():
			var collision = $cast5.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)
		$cast6.force_raycast_update()
		if $cast6.is_colliding():
			var collision = $cast6.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)
		$cast7.force_raycast_update()
		if $cast7.is_colliding():
			var collision = $cast7.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)
		$cast8.force_raycast_update()
		if $cast8.is_colliding():
			var collision = $cast8.get_collision_point()
			var distance = (collision - global_position).length()
			senses.append(distance)
		else:
			senses.append(1)
		#senses.append(_velocity)
		#print("seses",senses)

		return senses
	
func act(actions: Array) -> void:
	if actions[0] > 0.3:
		#Input.action_press("move_right", actions[0])
		rightst = 1
	
	elif actions[1] >0.3:
		leftst = -1
		#Input.action_press("move_left", actions[1])
	elif actions[2] > 0.3:
		jumpp = true
		#Input.action_press("jump")

func get_fitness() -> float:
	#var distanceTravelled = (float(endposition - startposition) * 60 / (15720 * (etime-stime))) + 1 # (x distance from start to end in lv 1 is 15720)
	var distanceTravelled = (float(endposition - startposition)  /15720) + 1 # (x distance from start to end in lv 1 is 15720)
	return distanceTravelled



##start positiin (127 , 724)

