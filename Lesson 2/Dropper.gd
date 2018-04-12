extends Node2D

onready var game = get_node("/root/Game")
onready var back = game.get_node("Parallax")

var moved = 0
var justdropped = false
var enabled = true

var water  = preload("WaterSprite.tscn")

func _ready():
	randomize(true)
	set_process(true)
	
func _process(delta):
	if game.isPlaying() == false:
		return

	moved += game.speed * delta * 2.5
	
	if moved >= 124:
		if enabled:
			generate_hazard(delta)
		moved = 0

func generate_hazard(delta):
	var drop = rand_range(1, 100) < 50
	
	if drop and justdropped == false:
		var type = rand_range(1,3)
		if type == 1:
			pass
		if type == 2:
			pass
		if type == 3:
			pass
			
		var terrain = water.instance()
		add_child(terrain)
		terrain.set_pos(Vector2(1280, 664))
		justdropped = true
	else:
		justdropped = false

func enable_hazards():
	enabled = true

func disable_hazards():
	enabled = false