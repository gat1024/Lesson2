extends Area2D

onready var baseLine = get_pos().y
onready var blocks = get_node("/root/Game/Dropper")
onready var game = get_node("/root/Game")
onready var sprite = get_node("Sprite")

var gravity = 50
var verticalVel = 0
var rate = 5

const RUNNING = 0
const JUMPING = 1
const FALLING = 2
const COLLIDED = 3

var state = RUNNING

func _ready():
	sprite.set_animation("running")
	set_process(true)
	
func _process(delta):
	if game.isPlaying() == false:
		return

	if state == RUNNING:
		do_running(delta)
		
	elif state == FALLING:
		do_falling(delta)
		
	elif state == JUMPING:
		do_jumping(delta)


func do_running(delta):
	if Input.is_action_pressed("ui_accept"):
		state = JUMPING
		verticalVel = 100
		sprite.set_animation("jumping")
	pass
	
func do_falling(delta):
	var pos = get_pos()
	pos.y -= verticalVel * delta * rate
	verticalVel -= gravity * delta * rate
	
	if pos.y >= baseLine:
		pos.y = baseLine
		verticalVel = 0
		state = RUNNING
		sprite.set_animation("running")
	
	set_pos(pos)
	
func do_jumping(delta):
	var pos = get_pos()
	pos.y -= verticalVel * delta * rate
	verticalVel -= gravity * delta * rate
	
	if verticalVel < 0:
		state = FALLING
		sprite.set_animation("falling")
	
	set_pos(pos)

func notifyCollision(who):
	if who.get_node("water"):
		print("You hit the water!")
#		sprite.set_animation("hit")
#		game.stop()

