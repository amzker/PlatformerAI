extends Area2D

#onready var anim: AnimationPlayer = get_node("AnimationPlayer")


func _on_coin_body_entered(body):
	$gotcoin.play()
#TRMODE LEFT LIKED THIS FOR FUTURE HELP 
	if Variables.TRMODE:
		queue_free()
	else:
		queue_free()
	if body.name == "player":
		Variables.plcoin = Variables.plcoin + 1
	elif body.name == "AI":
		Variables.AIcoin = Variables.AIcoin + 1
	else:
		Variables.AIcoin = Variables.AIcoin + 1
