extends Node
var LEVEL =  "res://src/levels/level1.tscn"
var repeat = str(true)
var vsai = str(false)
var AI_CONFIG = "level1"
var TRMODE = str(false)
var plcoin = 0
var AIcoin = 0
var GUI  = true
var plname = "amzker"
var serverip = ""

func _on_repeat_toggled(button_pressed):
	repeat = String(button_pressed).to_lower()
	Variables.repeat = str(repeat)
	Background_Music.stop()

func _on_vsai_toggled(button_pressed):
	vsai = String(button_pressed).to_lower()
	Variables.vsai = str(vsai)

func _on_OptionButton_item_selected(index):
	var op = $OptionButton.get_item_text(index)
	LEVEL = str("res://src/levels/",op,".tscn")
	Variables.LEVEL = LEVEL
	if "testlv" in op:
		vsai = "false"
		Variables.vsai = vsai
	Variables.AI_CONFIG = str(op)

	
func _on_playb_pressed():
	if vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif vsai == "false":
		get_tree().change_scene("res://src/UI/lvloader.tscn")


func _on_multiplayer_pressed():
	get_tree().change_scene("res://src/UI/Menu.tscn")
