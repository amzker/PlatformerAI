extends Node

func _physics_process(delta):
	$playercount.text = str(Variables.plcoin) 
	$AIcount.text = str(Variables.AIcoin) 

