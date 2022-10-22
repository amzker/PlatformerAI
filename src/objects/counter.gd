extends Label


var coins = 0


func _on_coin_coin_collected():
	coins = coins + 1
	$".".text = str(coins) 
