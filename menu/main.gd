extends Node2D

func _unhandled_input(_event):
	get_tree().change_scene_to_file("res://body/gamescene.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://body/gamescene.tscn")
