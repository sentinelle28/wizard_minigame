extends Node

signal take_dmg

var health = 3

func change_health(health_ca):
	health -= health_ca
	if health <= 0:
		Wave.is_playing = false
		Wave.is_continuing = false
		get_tree().paused = true
	else:
		emit_signal("take_dmg")
		Wave.is_playing = false
		
