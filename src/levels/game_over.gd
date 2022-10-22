extends Node2D

func _ready():
	$loss.play()



func _on_replay_pressed():
	get_tree().change_scene("res://src/levels/testlv.tscn")
	
func _physics_process(delta):
		if Input.is_action_just_pressed("retry"):
			get_tree().change_scene("res://src/levels/testlv.tscn")
		
