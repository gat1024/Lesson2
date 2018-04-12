extends Node

var speed = 150

const START    = 0
const PLAYING  = 1
const GAMEOVER = 2

var gameMode = PLAYING

func _ready():
	gameMode = PLAYING
	set_process(true)
		
func _process(delta):
	pass

func play():
	gameMode = PLAYING
	speed = 150
	
func stop():
	gameMode = GAMEOVER
	speed = 0
	

func isPlaying():
	return gameMode == PLAYING
	
func isStart():
	return gameMode == START
	
func isOver():
	return gameMode == GAMEOVER