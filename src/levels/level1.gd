extends Node2D


func _ready():
	Variables.LEVEL = "res://src/levels/level1.tscn"
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

