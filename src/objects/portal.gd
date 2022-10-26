tool
extends Area2D

onready var anima: AnimationPlayer = $AnimationPlayer



func _on_portal_body_entered(body):
	var name = body.get_name()
	if name == "player":
		$won.play()
	elif name == "AI":
		
		if Variables.repeat == "true":
			if Variables.vsai == "true":
				get_tree().change_scene("res://AI/AIvsPlayer.tscn")
			elif Variables.vsai == "false":
				get_tree().change_scene("res://src/UI/lvloader.tscn")
		else:
			get_tree().change_scene("res://src/UI/WELCOME.tscn")


func teleport()->void:
	anima.play("fade_in")
	yield(anima, "animation_finished")
	var numi = String(Variables.LEVEL).to_int()
	var next_scene = str("res://src/levels/level",numi+1,".tscn")
	Variables.LEVEL = next_scene
	if Variables.vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif Variables.vsai == "false":
		get_tree().change_scene("res://src/UI/lvloader.tscn")
		 
func _on_won_finished():
	teleport()
