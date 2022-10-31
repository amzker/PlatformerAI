extends Control

var time = 0
var total_time = 0
var time_step = 0.2
var generation_step = 10
var agent_body_path = "res://src/actors/AI.tscn"
var track_path = "res://src/TRlevels/TRlevel1.tscn"
#var agent_body_path = "res://src/TRlevels/AI2.tscn"
#var track_path = "res://src/TRlevels/TR_Testing.tscn"
#var ga = GeneticAlgorithm.new(2, 2, agent_body_path, true, "AI_params2")
#var ga = GeneticAlgorithm.new(13, 3, agent_body_path, true, "AI_params")
#var ga = GeneticAlgorithm.new(8, 3, agent_body_path, true, "AI_params")
var ga = GeneticAlgorithm.new(13, 3, agent_body_path, true, "AI_params")
var lvpath = "res://src/TRlevels/lvpaths/lv1path.tscn"
var fitness_threshold = 0
var paused = true

func place_bodies(bodies: Array) -> void:
	for last_gen_body in $testlv/Start.get_children():
		last_gen_body.queue_free()
	for body in bodies:
		$testlv/Start.add_child(body)

func _ready():
	#print("At train ai ready")
	Variables.TRMODE =  str(true)
	add_child(load(track_path).instance())
	add_child(load(lvpath).instance())
	add_child(ga)
	place_bodies(ga.get_curr_bodies())
	fitness_threshold = 500
	$ZoomPanCam.position = $testlv/Start.position 
	paused = false
	Background_Music.stop()

func end() -> void:
	paused = true
	

func continue_ga(new_threshold) -> void:
	print("continue ga is used")
	fitness_threshold = new_threshold
	paused = false


func _physics_process(delta) -> void:
	if not paused:
		time += delta; total_time += delta
		if time > time_step:
			ga.next_timestep()
			time = 0
		if total_time > generation_step or ga.all_agents_dead:
			ga.evaluate_generation()
			if ga.curr_best.fitness > fitness_threshold:
				end()
			ga.next_generation()
			remove_child($lv1pathnode)
			add_child(load(lvpath).instance())
			place_bodies(ga.get_curr_bodies())
			if ga.curr_generation % 2 == 0:
				generation_step += 6
				print("increased step to " + str(generation_step))
			total_time = 0


func _on_pause_toggled(button_pressed):
	############################################LEFT FROM HERE ########################################
	if button_pressed:
		paused = true
	else:
		paused = false

func _on_GUIb_toggled(button_pressed):
	Variables.GUI = button_pressed
