extends Node2D

func _ready():
	$start.play()


func _on_death_area_body_entered(body):
	get_tree().change_scene("res://src/levels/game_over.tscn")


func _physics_process(delta):
		if Input.is_action_just_pressed("retry"):
			get_tree().change_scene("res://src/levels/testlv.tscn")
		
