extends Area2D

onready var anim: AnimationPlayer = get_node("AnimationPlayer")


func _on_coin_body_entered(body):
	$gotcoin.play()
	anim.play("fade_out")
	
