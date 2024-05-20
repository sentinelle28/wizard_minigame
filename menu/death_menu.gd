extends CanvasLayer

@export_group("score")
@export var higscore_label:Label
@export var score_label:Label

@export_group("game")
@export var spawner:Node2D
@export var player:CharacterBody2D

# Called when the node enters the scene tree for the first time.
var is_loaded = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_loaded == false:
		$AnimationPlayer.play("death_menu_open")
		if PlayerPoint.highscore < PlayerPoint.point:
			PlayerPoint.highscore = PlayerPoint.point
		score_label.text = String(PlayerPoint.point)
		higscore_label.text = String(PlayerPoint.highscore)
		is_loaded = true
	
	


func _on_texture_button_pressed():
	$AnimationPlayer.play("RESET")
	is_loaded = false
	Wave.is_playing = true
	Wave.is_continuing = true
	Health.health = 3
	for child in player.get_children():
		if child is bullet_player:
			player.remove_child(child)
			
	
	
	get_tree().paused = false
	spawner.reset()
