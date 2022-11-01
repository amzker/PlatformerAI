extends Node2D
var currentG = 900

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
	if body.has_method("change_gravity"):
		body.change_gravity(-900)
		currentG = -900

func _on_portal_body_exited(body):
	pass

func _physics_process(delta):
	$background/Label.text = str("Gravity : ", currentG)
	

func _on_reverse_G2_body_entered(body):
	if body.has_method("change_gravity"):
		body.change_gravity(900)
		currentG = 900
