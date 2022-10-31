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
var playerpath = "res://src/actors/player.tscn"
var serverip = ""
var multp = false
var IPORT  = 28960
var op 
func _on_repeat_toggled(button_pressed):
	repeat = String(button_pressed).to_lower()
	Variables.repeat = str(repeat)

func _on_vsai_toggled(button_pressed):
	vsai = String(button_pressed).to_lower()
	Variables.vsai = str(vsai)

func _on_OptionButton_item_selected(index):
	op = $OptionButton.get_item_text(index)
	LEVEL = str("res://src/levels/",op,".tscn")
	Variables.LEVEL = LEVEL
	Variables.AI_CONFIG = str(op)
	if "testlv" or "level4" in op:
		#print("making it false")
		vsai = "false"
		Variables.vsai = vsai 

	
func _on_playb_pressed():
	#print(op)
	#print(vsai)
	if vsai == "true":
		get_tree().change_scene("res://AI/AIvsPlayer.tscn")
	elif vsai == "false":
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
