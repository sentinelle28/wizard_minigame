extends Control

@export_group("score")
@export var higscore_label:Label
@export var score_label:Label
@export var text_label:Label

@export_group("game")
@export var audio:AudioStreamPlayer
@export var spawner:Node2D
@export var player:CharacterBody2D
@export var hearth_container:HBoxContainer


# Called when the node enters the scene tree for the first time.
var is_loaded = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_loaded == false:
		$AnimationPlayer.play("death_menu_open")
		if PlayerPoint.highscore < PlayerPoint.point:
			PlayerPoint.highscore = PlayerPoint.point
		score_label.text = str(PlayerPoint.point)
		higscore_label.text = str(PlayerPoint.highscore)
		is_loaded = true
		
		if Wave.current_wave == 19:
			text_label.text = "You win"
		else:
			text_label.text = "You died"
	
	




func reset():
	#texture reset
	visible = false
	is_loaded = false
	#scene reset
	Wave.is_playing = true
	Wave.is_continuing = true
	Health.health = 3
	
	
	#score reset
	PlayerPoint.point = 0
	PlayerPoint.reset()
	
	#tree reset
	get_tree().paused = false
	#wave reset
	audio.play()
	player.reset()
	hearth_container.reset()
	spawner.reset()

func _unhandled_input(_event):
	reset()
