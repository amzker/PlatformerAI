extends "res://src/actors/actor.gd"


func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x
	_velocity.y = -speed.y 
func _on_hit_body_entered(body)-> void:
	if body.global_position.y > get_node("hit").global_position.y:
		return
	get_node("CollisionPolygon2D").disabled = true
	queue_free()



func _physics_process(delta: float)-> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	


