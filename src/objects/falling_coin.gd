extends KinematicBody2D

const GRAVITY = 12

var velocity = Vector2.ZERO


func _physics_process(delta):
	velocity.y += GRAVITY * delta
	move_and_collide(velocity)

