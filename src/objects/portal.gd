tool
extends Area2D

onready var anima: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene


func _on_portal_body_entered(body):
	$won.play()

func _get_configuration_warning() -> String:
	return "Next scene not availible" if not next_scene else ""

func teleport()->void:
	anima.play("fade_in")
	yield(anima, "animation_finished")
	get_tree().change_scene_to(next_scene)
 
func _on_won_finished():
	teleport()
