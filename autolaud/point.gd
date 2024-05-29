extends Node

var point = 0
var highscore = 0
var time_left_to_reset = 0
var current_mult = 1

func reset():
	current_mult = 1
	time_left_to_reset = 0

func add_point(points):
	point += points * current_mult
	time_left_to_reset = 3 + 3*current_mult/100
	current_mult += 0.1

func _process(delta):
	time_left_to_reset -= delta
	if time_left_to_reset <= 0:
		reset()
	
	
