extends Label

func _physics_process(delta):
	$".".text = str(Variables.plcoin) 
	$AIcount.text = str(Variables.AIcoin) 

