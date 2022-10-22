extends Node2D

func _ready():
	$loss.play()

func _on_l1_pressed():
	get_tree().change_scene("res://src/levels/testlv.tscn")

func _on_l2_pressed():
	get_tree().change_scene("res://src/levels/level2.tscn")


func _on_l3_pressed():
	get_tree().change_scene("res://src/levels/level3.tscn")


func _physics_process(delta):
		if Input.is_action_just_pressed("1"):
			_on_l1_pressed()
		elif Input.is_action_just_pressed("2"):
			_on_l2_pressed()
		elif Input.is_action_just_pressed("3"):
			_on_l3_pressed()

