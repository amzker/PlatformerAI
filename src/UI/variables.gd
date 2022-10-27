extends Node
var LEVEL =  "res://src/levels/level1.tscn"
var repeat = str(true)
var vsai = str(false)
var AI_CONFIG = "level1"
var TRMODE = str(false)

func _on_repeat_toggled(button_pressed):
	repeat = String(button_pressed).to_lower()
	Variables.repeat = str(repeat)

func _on_vsai_toggled(button_pressed):
	vsai = String(button_pressed).to_lower()
	Variables.vsai = str(vsai)

func _on_OptionButton_item_selected(index):
	if index == 0:
		LEVEL = "res://src/levels/level1.tscn"
		AI_CONFIG = "level1"
		Variables.LEVEL = LEVEL
		Variables.AI_CONFIG = AI_CONFIG
	elif index == 1:
		LEVEL = "res://src/levels/level2.tscn"
		AI_CONFIG = "level2"
		Variables.LEVEL = LEVEL
		Variables.AI_CONFIG = AI_CONFIG
	elif index == 2:
		LEVEL = "res://src/levels/level3.tscn"
		AI_CONFIG = "level3"
		Variables.LEVEL = LEVEL
		Variables.AI_CONFIG = AI_CONFIG
	elif index == 3:
		LEVEL = "res://src/levels/level4.tscn"
		AI_CONFIG = "level4"
		Variables.LEVEL = LEVEL
		Variables.AI_CONFIG = AI_CONFIG
		Variables.vsai = str(false)
func _on_playb_pressed():
	if vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif vsai == "false":
		get_tree().change_scene("res://src/UI/lvloader.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_on_playb_pressed()


	
