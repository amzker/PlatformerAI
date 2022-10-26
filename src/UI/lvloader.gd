extends Node2D

var level = "res://src/levels/"+Variables.LEVEL+".tscn"

func _ready():
	level = load(level).instance()
	add_child(level)

