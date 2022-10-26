extends Node


var LEVEL 
var repeat 
var vsai  
var AI_CONFIG 

func _on_repeat_toggled(button_pressed):
	Variables.repeat = String(button_pressed).to_lower()


func _on_vsai_toggled(button_pressed):
	Variables.vsai = String(button_pressed).to_lower()

func _on_OptionButton_item_selected(index):
	if index == 0:
		Variables.LEVEL = "res://src/levels/level1.tscn"
		Variables.AI_CONFIG = "level1"
	elif index == 1:
		Variables.LEVEL = "res://src/levels/level2.tscn"
		Variables.AI_CONFIG = "level2"
	elif index == 2:
		Variables.LEVEL = "res://src/levels/level3.tscn"
		Variables.AI_CONFIG = "level3"

func _on_playb_pressed():
	if vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif vsai == "false":
		get_tree().change_scene("res://src/UI/lvloader.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_on_playb_pressed()
