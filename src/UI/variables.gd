extends Node
var LEVEL =  "res://src/levels/level1.tscn"
var repeat = true
var vsai = false
var AI_CONFIG = "level1"
var TRMODE = false
var plcoin = 0
var AIcoin = 0
var GUI  = true
var plname = "amzker"
var playerpath = "res://src/actors/player.tscn"
var serverip = ""
var multp = false
var IPORT  = 28960
var op 
var nonAiLevels = ["testlv", "level4"]
func _on_repeat_toggled(button_pressed):
	if button_pressed:
		repeat = true
	else:
		repeat = false
	Variables.repeat = repeat

func _on_vsai_toggled(button_pressed):
	if button_pressed:
		vsai = true
	else:
		vsai = false
	Variables.vsai = vsai

func _on_OptionButton_item_selected(index):
	op = $OptionButton.get_item_text(index)
	LEVEL = str("res://src/levels/",op,".tscn")
	Variables.LEVEL = LEVEL
	Variables.AI_CONFIG = str(op)
	#print(op)
	
		
func _on_playb_pressed():
	if op == "testlv": #or did not worked so idk
		#print("making it false")
		vsai = false
		Variables.vsai = vsai 
	elif op == "level4":
		#print("making it false")
		vsai = false
		Variables.vsai = vsai 
	if vsai:
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	else:
		get_tree().change_scene("res://src/UI/lvloader.tscn")


func _on_multiplayer_pressed():
	get_tree().change_scene("res://src/UI/Menu.tscn")
	Variables.multp = true
	


func _on_LineEdit_text_entered(new_text):
	Variables.plname = new_text


func _on_music_toggled(button_pressed):
	if button_pressed:
		if Background_Music.playing:
			pass
		else:
			Background_Music.play()
	else:
		Background_Music.stop()
