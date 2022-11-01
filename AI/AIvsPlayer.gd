extends Node2D

var player = Variables.playerpath
var level = Variables.LEVEL
var AI = "res://src/actors/AI.tscn"
var AI_NAME = Variables.AI_CONFIG
var paused = true
var time = 0
var time_step = 0.2
var network


func update() -> void:
	var output = network.update(AI.sense())
	AI.act(output)
	
func _ready():
	level = load(level).instance()
	#print(level)
	player = load(player).instance()
	add_child(level)
	AI = load(AI).instance()
	$testlv/PlayerStart.add_child(player)
	$testlv/Start.add_child(AI)
	
	network = load("res://NEAT_usability/standalone_scripts/standalone_neuralnet.gd").new()
	network.load_config(AI_NAME)
	paused = false


func _physics_process(delta) -> void:
	update()
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene("res://src/UI/WELCOME.tscn")
