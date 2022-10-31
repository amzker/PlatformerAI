tool
extends Area2D

onready var anima: AnimationPlayer = $AnimationPlayer

var first = ""
var secound = ""

func _on_portal_body_entered(body):
	var name = body.get_name()
	if first == "":
		first = name
	else:
		secound = name
	if Variables.multp:
		pass
	else:
		if first == "player":
			$won.play()
		elif first == "AI":
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
	if numi < 4:
		var next_scene = str("res://src/levels/level",numi+1,".tscn")
		Variables.LEVEL = next_scene
		Variables.plcoin = 0
		Variables.AIcoin = 0 
		if Variables.vsai == "true":
			get_tree().change_scene("res://AI/AIvsPlayer.tscn")
		elif Variables.vsai == "false":
			get_tree().change_scene("res://src/UI/lvloader.tscn")
	else:
		get_tree().change_scene("res://src/UI/WELCOME.tscn")
func _on_won_finished():
	teleport()
