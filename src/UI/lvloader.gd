extends Node2D

var level = Variables.LEVEL
var pl = Variables.playerpath
func _ready():
	level = load(level).instance()
	add_child(level)
	if Variables.multp:
		pass
	else:
		pl = load(pl).instance()
		add_child(pl)
func _physics_process(delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene("res://src/UI/WELCOME.tscn")

