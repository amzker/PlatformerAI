extends Node2D

func _ready():
	if OS.get_name() == "Android":
		pass
	elif OS.get_name() == "iOS":
		pass
	else:
		get_node("UI/Virtual joystick").visible = false
		get_node("UI/Virtual joystick2").visible = false

func _on_deathbed_body_entered(body):
	print("Death byu bed")
	get_tree().change_scene("res://src/levels/game_over.tscn")

func _physics_process(delta):
		if Input.is_action_just_pressed("retry"):
			get_tree().change_scene("res://src/levels/level4.tscn")


