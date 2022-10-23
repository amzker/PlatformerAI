extends Node2D

func _ready():
	Background_Music.stop()
	$loss.play()

func _on_l1_pressed():
	get_tree().change_scene("res://src/levels/testlv.tscn")
	Background_Music.play()

func _on_l2_pressed():
	get_tree().change_scene("res://src/levels/level2.tscn")
	Background_Music.play()

func _on_l3_pressed():
	get_tree().change_scene("res://src/levels/level3.tscn")
	Background_Music.play()

func _physics_process(delta):
		if Input.is_action_just_pressed("1"):
			_on_l1_pressed()
		elif Input.is_action_just_pressed("2"):
			_on_l2_pressed()
		elif Input.is_action_just_pressed("3"):
			_on_l3_pressed()

