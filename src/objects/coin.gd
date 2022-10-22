extends Area2D

onready var anim: AnimationPlayer = get_node("AnimationPlayer")

signal coin_collected 

func _on_coin_body_entered(body):
	$gotcoin.play()
	emit_signal("coin_collected")
	anim.play("fade_out")



