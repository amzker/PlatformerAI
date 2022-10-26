extends Node2D

var level = Variables.LEVEL

func _ready():
	level = load(level).instance()
	add_child(level)

func _physics_process(delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene("res://src/UI/WELCOME.tscn")

