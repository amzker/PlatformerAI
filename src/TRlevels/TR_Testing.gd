extends Node2D


func _ready():
	randomize()
	spawn_coin()

func spawn_coin():
	var fcoin = load("res://src/objects/falling_coin.tscn").instance()
	fcoin.position.x = randi() % int($ENDR.position.x)
	fcoin.position.y = 150
	add_child(fcoin)
	Variables.coinx = fcoin.position.x
	
func _on_coincleaner_body_entered(body):
	if "falling" in body.name:
		body.queue_free()


func _on_coinspawner_body_entered(body):
	var t = Timer.new()
	#t.set_wait_time(randi()% 8)
	t.set_wait_time(3)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	spawn_coin()
