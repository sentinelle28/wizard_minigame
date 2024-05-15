extends Node

var health = 3

func change_health(health_ca):
	health -= health_ca
	if health <= 0:
		Wave.is_playing = false
		
