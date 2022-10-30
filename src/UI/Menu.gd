extends Control

onready var IpAddr := $Control/IpAddr
var player = load(Variables.playerpath)
#var player = load("res://src/UI/Player.tscn")

var current_spawn_location_instance_number = 1
var current_player_for_spawn_location_number = null

func _ready():
	Background_Music.stop()
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	$iplabel.text = Network.ip_address
	Variables.serverip = Network.ip_address
	$Control/port.placeholder_text = str("Default Port: ",Variables.IPORT)
	$Control/IpAddr.placeholder_text = str("Defuat IP:", Variables.serverip)


func _player_connected(id) -> void:
	# Called on both clients and server when a peer connects.
	print("Player " + str(id) + " has connected")
	instance_player(id)

func _player_disconnected(id) -> void:
	print("Player " + str(id) + " has disconnected")
	if Persistent_nodes.has_node(str(id)):	
		Persistent_nodes.get_node(str(id)).queue_free()

func _connected_to_server() -> void:
	# Only called on clients, not server.
	yield(get_tree().create_timer(0.1), "timeout")
	instance_player(get_tree().get_network_unique_id())

func _on_CreateServer_pressed():
	Network.create_server()
	$Control.hide()
	instance_player(get_tree().get_network_unique_id())


func _on_JoinServer_pressed():
	Network.ip_address = IpAddr.text
	$Control.hide()
	$Control/CreateServer.hide()
	Network.join_server()

func _on_StartGame_pressed():
	self.rpc("switch_to_game")

sync func switch_to_game() -> void:
	# warning-ignore:RETURN_VALUE_DISCARDED
	get_tree().change_scene("res://src/UI/lvloader.tscn")
	#get_tree().change_scene("res://src/UI/World.tscn")

func instance_player(id) -> void:
	var player_instance = Global.instance_node(player, Persistent_nodes)
	player_instance.name = str(id)
	player_instance.set_network_master(id)
	if current_spawn_location_instance_number > 6:
		current_spawn_location_instance_number = 1
	else:
		current_spawn_location_instance_number += 1


func _on_Name_text_changed(new_text):
	Variables.plname = new_text


func _on_port_text_changed(new_text):
	Variables.IPORT = int(new_text)


func _on_menubt_pressed():
	get_tree().change_scene("res://src/UI/Menu.tscn")



func _on_IpAddr_text_changed(new_text):
	Network.ip_address = new_text
