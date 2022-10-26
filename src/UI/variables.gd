extends Node


var LEVEL = "res://src/levels/level1.tscn"
var repeat = str("true")
var vsai  = str("true")
var AI_CONFIG = "level1"

func _on_repeat_toggled(button_pressed):
	repeat = String(button_pressed).to_lower()


func _on_vsai_toggled(button_pressed):
	vsai = String(button_pressed).to_lower()

func _on_OptionButton_item_selected(index):
	if index == 0:
		LEVEL = "res://src/levels/level1.tscn"
		AI_CONFIG = "level1"
	elif index == 1:
		LEVEL = "res://src/levels/level2.tscn"
		AI_CONFIG = "level2"
	elif index == 2:
		LEVEL = "res://src/levels/level2.tscn"
		AI_CONFIG = "level3"

func _on_playb_pressed():
	if vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif vsai == "false":
		get_tree().change_scene("res://src/UI/lvloader.tscn")

