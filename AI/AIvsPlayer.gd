extends Node2D

var player = "res://src/actors/player.tscn"
var level = str("res://src/levels/"+Variables.LEVEL+".tscn")
var AI = "res://src/actors/AI.tscn"
var AI_NAME = Variables.LEVEL
var paused = true
var time = 0
var time_step = 0.2
var network


func update() -> void:
	var output = network.update(AI.sense())
	AI.act(output)
	
func _ready():
	print(level)
	add_child(load(level).instance())
	player = load(player).instance()
	AI = load(AI).instance()
	#$testlv/PlayerStart.add_child(player)
	$testlv/Start.add_child(AI)
	network = load("res://NEAT_usability/standalone_scripts/standalone_neuralnet.gd").new()
	network.load_config(AI_NAME)
	paused = false


func _physics_process(delta) -> void:
	update()
