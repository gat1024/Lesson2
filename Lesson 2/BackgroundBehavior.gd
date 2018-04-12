extends ParallaxBackground

onready var game = get_node("/root/Game")

var distance = 0

func _ready():
	set_process(true)
	
func _process(delta):
	if game.isPlaying() == false:
		return

	distance = distance - game.speed * delta
	set_scroll_offset(Vector2(distance, 0))
	