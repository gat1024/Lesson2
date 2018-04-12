extends Area2D

onready var game = get_node("/root/Game")
onready var player = get_node("/root/Game/Player")

func _ready():
	set_process(true)

func _process(delta):
	if !game.isPlaying():
		return

	var pos = get_pos()
	pos.x -= game.speed * delta * 2.5
	
	set_pos (pos)
	
	if pos.x < -128:
		self.queue_free()

	if self.overlaps_area(player):
		player.notifyCollision (self)
