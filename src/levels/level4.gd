extends Node2D

func _ready():
	if OS.get_name() == "Android":
		pass
	elif OS.get_name() == "iOS":
		pass
	else:
		get_node("UI/Virtual joystick").visible = false
		get_node("UI/Virtual joystick2").visible = false



func _on_MENUB_pressed():
	get_tree().change_scene("res://src/UI/WELCOME.tscn")



func _on_RestartB_pressed():
	if Variables.vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif Variables.vsai == "false":
		get_tree().change_scene("res://src/UI/lvloader.tscn")
