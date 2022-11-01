extends Actor

export var stomp: = 1000.0

signal death 
var raycasters = []
var num_casts = 8
var sight_range = 1000
var startposition = 0
var currentposi = 0
var rightst = 0
var leftst = 0
var jumpp: bool = false
var ENDRPOSI 
var fitness = 0
var coinsbyai = 0

func _ready():
	if Variables.TRMODE:
		startposition = get_node("/root/trainer/testlv/Start").position #testlv/Start.position #testlv is main node name of all levels and will be availible when ai added to it as childS
		ENDRPOSI =  get_node("/root/trainer/testlv/ENDR").position
	else:
		currentposi = self.position
		if Variables.vsai:
			ENDRPOSI = get_node("/root/AIvsPlayer/testlv/ENDR").position
		else:
			ENDRPOSI = get_node("/root/lvloader/testlv/ENDR").position 

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

func _on_enhit_body_entered(body)-> void: #this one connects to enemy 
	currentposi = self.position
	
	if Variables.TRMODE:
		emit_signal("death")
	else:
		pass
		#queue_free()

func _on_CoinDetectArea_area_entered(area):
	coinsbyai = coinsbyai + 1
	
func _physics_process(delta: float)-> void:
	var is_jump_stopped: = Input.is_action_just_released("jump") and _velocity.y < 0
	var direction: = get_direction(rightst,leftst,jumpp)
	_velocity = calc_velocity(_velocity,AIspeed,direction, is_jump_stopped)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	currentposi = self.position



####ALGORITHM  NEEDS
var arsense = 0

func _on_SENSOR_body_entered(body):
	arsense = body.global_position.x

func sense() -> Array:
	var senses = []
	if arsense == 1 :
		senses.append(1)
	else:
		senses.append(arsense)
	senses.append(currentposi.x)
	#senses.append(coinsbyai)
	#print(senses)
	return senses

func act(actions: Array) -> void:
	if actions[0] > 0.4:
		rightst = actions[0]
	elif actions[1] > 0.4:
		leftst = actions[1]

func get_fitness() -> float:
	fitness = coinsbyai
	if fitness == 0:
		fitness = 1
	return fitness






