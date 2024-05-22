extends CanvasLayer

@export_group("score")
@export var higscore_label:Label
@export var score_label:Label

@export_group("game")
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
	
	


func _on_texture_button_pressed():
	#texture reset
	visible = false
	is_loaded = false
	#scene reset
	Wave.is_playing = true
	Wave.is_continuing = true
	Health.health = 3
	#no bullet
	for child in player.get_children():
		if child is bullet_player:
			player.remove_child(child)
	
	#score reset
	PlayerPoint.point = 0
	PlayerPoint.reset()
	
	#tree reset
	get_tree().paused = false
	#wave reset
	player.reset()
	hearth_container.reset()
	spawner.reset()
