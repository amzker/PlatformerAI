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


func wait(time):
	var t = Timer.new()
	t.set_wait_time(time)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()


func _on_reverse_G_body_entered(body):
		$player.gravity = -900
	#	

func _on_portal_body_exited(body):
	$player.gravity = -20

func _physics_process(delta):
	if Input.is_action_just_pressed("gravityup"):
		$player.gravity += Input.get_action_strength("ui_up") * 500
	elif Input.is_action_just_pressed("gravitydown"):
		$player.gravity -= Input.get_action_strength("gravitydown") * 500
	$background/Label.text = str("Gravity : ", $player.gravity)
	


func _on_reverse_G2_body_entered(body):
	$player.gravity = 900
