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

			if Variables.repeat:
				if Variables.vsai:
					get_tree().change_scene("res://AI/AIvsPlayer.tscn")
				else:
					get_tree().change_scene("res://src/UI/lvloader.tscn")

			else:
				get_tree().change_scene("res://src/UI/WELCOME.tscn")

func _on_won_finished():
	teleport()

func teleport()->void:
	anima.play("fade_in")
	yield(anima, "animation_finished")
	#print("cr level: ", Variables.LEVEL)
	var numi = String(Variables.LEVEL).to_int()
	#print("Cr LEVEL", Variables.LEVEL)
	if numi < 6:
		var next_scene = str("res://src/levels/level",numi+1,".tscn")
		Variables.LEVEL = next_scene
		Variables.plcoin = 0
		Variables.AIcoin = 0 
		if Variables.vsai:
			get_tree().change_scene("res://AI/AIvsPlayer.tscn")
		else:
			get_tree().change_scene("res://src/UI/lvloader.tscn")
	else:
		get_tree().change_scene("res://src/UI/WELCOME.tscn")
