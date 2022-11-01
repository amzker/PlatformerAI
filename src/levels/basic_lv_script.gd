extends Node2D


func _ready():
	var os_name = OS.get_name()
	if os_name == "Android":
		$"UI/Virtual joystick".show()
		$"UI/Virtual joystick2".show()
	elif os_name == "iOS":
		$"UI/Virtual joystick".show()
		$"UI/Virtual joystick2".show()
	else:
		$"UI/Virtual joystick".hide()
		$"UI/Virtual joystick2".hide()



func _on_MENUB_pressed():
	get_tree().change_scene("res://src/UI/WELCOME.tscn")



func _on_RestartB_pressed():
	if Variables.vsai:
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	else:
		get_tree().change_scene("res://src/UI/lvloader.tscn")



func _on_zeroG_body_entered(body):
	if body.has_method("change_gravity"):
		body.change_gravity(-100)

func _on_zeroG_body_exited(body):
	if body.has_method("change_gravity"):
		body.change_gravity(900)
