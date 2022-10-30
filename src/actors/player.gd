extends Actor
export var stomp: = 1000.0
var plname = Variables.plname
onready var tween := $Tween
onready var camera := $Camera2D
puppet var puppet_position = Vector2(0, 0) setget puppet_position_set
puppet var puppet_velocity = Vector2() setget puppet_velocity_set


func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left") ,-1 if Input.is_action_just_pressed("jump") and is_on_floor() else 1)

func puppet_velocity_set(new_value) -> void:
	puppet_position = new_value

func puppet_position_set(new_value) -> void:
	puppet_position = new_value
	tween.interpolate_property(self, "global_position", global_position, puppet_position, 0.1)
	tween.start()

func _ready():
	yield(get_tree(), "idle_frame")
	if get_tree().has_network_peer():
		if is_network_master():
			camera.make_current()
	$player_name.text = plname
	
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
	if Variables.repeat == "true":
		if Variables.vsai == "true":
			Variables.AIcoin = 0
			Variables.plcoin = 0
			get_tree().change_scene("res://AI/AIvsPlayer.tscn")
		elif Variables.vsai == "false":
			get_tree().change_scene("res://src/UI/lvloader.tscn")
	else:
		get_tree().change_scene("res://src/UI/WELCOME.tscn")

func _process(_delta) -> void:
	if get_tree().has_network_peer():
		if is_network_master():
			var is_jump_stopped: = Input.is_action_just_released("jump") and _velocity.y < 0
			var direction: = get_direction()
			_velocity = calc_velocity(_velocity,speed,direction, is_jump_stopped)
			_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
		else:
			if not tween.is_active():
				move_and_slide(puppet_velocity * speed)


sync func die() -> void:
	self.queue_free()


sync func update_position(pos):
	global_position = pos
	puppet_position = pos

func _on_Network_tick_rate_timeout():
	if get_tree().has_network_peer():
		if is_network_master():
			self.rset_unreliable("puppet_position", global_position)
			self.rset_unreliable("puppet_velocity", _velocity)


#func _physics_process(delta: float)-> void:
	"""
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
"""
	
	




