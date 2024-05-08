extends Node2D

@export var player:CharacterBody2D



func activate(type):
	var new_enemy = load(EnemyRef.monster[type]).instantiate()
	new_enemy.player = player
	add_child(new_enemy)
	new_enemy.global_position = global_position
	
	
