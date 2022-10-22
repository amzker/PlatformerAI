extends Node2D

func _ready():
	$start.play()


func _physics_process(delta):
		if Input.is_action_just_pressed("retry"):
			get_tree().change_scene("res://src/levels/level3.tscn")
		
