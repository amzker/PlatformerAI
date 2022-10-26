extends Node


var LEVEL = "level1"
var repeat = str("true")
var vsai  = str("true")


func _on_repeat_toggled(button_pressed):
	repeat = String(button_pressed).to_lower()


func _on_vsai_toggled(button_pressed):
	vsai = String(button_pressed).to_lower()

func _on_OptionButton_item_selected(index):
	if index == 0:
		LEVEL = "level1"
	elif index == 1:
		LEVEL = "level2"
	elif index == 2:
		LEVEL = "level3"


func _on_playb_pressed():
	if vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif vsai == "false":
		get_tree().change_scene("res://src/UI/lvloader.tscn")

