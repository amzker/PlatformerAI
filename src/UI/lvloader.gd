extends Node2D

var level = Variables.LEVEL
var pl = Variables.playerpath
var current_spawn_location_instance_number = 1
var current_player_for_spawn_location_number = null

func _ready():
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	level = load(level).instance()
	add_child(level)
	if get_tree().is_network_server():
		setup_players_positions()

	if Variables.multp:
		pass
		#print("not addding player, becuase network will add it")
	else:
		if "testlv" in Variables.LEVEL:
			pass
		else:
			#print("adding player")
			pl = load(pl).instance()
			add_child(pl)

func setup_players_positions() -> void:
	for player in Persistent_nodes.get_children():
		for spawn_location in $Spawning_nodes.get_children():
			if int(spawn_location.name) == current_spawn_location_instance_number and current_player_for_spawn_location_number != player:
				player.rpc("update_position", spawn_location.global_position)
				current_spawn_location_instance_number += 1
				current_player_for_spawn_location_number = player

func _player_disconnected(id) -> void:
	print("Player " + str(id) + " has disconnected")
	if Persistent_nodes.has_node(str(id)):
		Persistent_nodes.get_node(str(id)).queue_free()

func _physics_process(delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene("res://src/UI/WELCOME.tscn")

