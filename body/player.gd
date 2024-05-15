extends CharacterBody2D

@export var spawn_location : Array[Node2D]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_direction()
		
func change_direction():
	var direction = sign(global_position-get_global_mouse_position())
	if direction == Vector2(1,-1) or direction == Vector2(1,1):
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	
func shoot():
	if Input.is_action_just_pressed("ui_accept"):
		spawn_location.sort_custom(sort_distance)
		#projectile spawn
		
		
func sort_distance(a,b):
	var mouse_pos = get_global_mouse_position()
	return a.global_position.distance_to(mouse_pos) < b.global_position.distance_to(mouse_pos)

func take_dmg(dmg):
	Health.change_health(dmg)
