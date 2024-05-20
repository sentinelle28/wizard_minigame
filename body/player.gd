extends CharacterBody2D

@export var spawn_location : Array[Node2D]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_direction()
	update_spell()
	shoot()
		
func change_direction():
	var direction = sign(global_position-get_global_mouse_position())
	if direction == Vector2(1,-1) or direction == Vector2(1,1):
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
func update_spell():
	if Input.is_action_just_pressed("change_spell_down"):
		Currentspell.currentspell -= 1
		if Currentspell.currentspell<0:
			Currentspell.currentspell = 3
	elif Input.is_action_just_pressed("change_spell_up"):
		Currentspell.currentspell += 1
		if Currentspell.currentspell > 3 :
			Currentspell.currentspell = 0
	
	
func shoot():
	if Input.is_action_just_pressed("shoot"):
		spawn_location.sort_custom(sort_distance)
		#projectile spawn
		var bullet = load(Currentspell.spell_ref[Currentspell.currentspell]).instantiate()
		add_child(bullet)
		bullet.global_position = spawn_location[0].global_position
		bullet.direction = match_direction()
		
		
func match_direction():
	match spawn_location[0].name:
		"top_shoot":
			return Vector2(0,-1)
		"left_shoot":
			return Vector2(-1,0)
		"rigth_shoot":
			return Vector2(1,0)
		"bottom_shoot":
			return Vector2(0,1)
		
func sort_distance(a,b):
	var mouse_pos = get_global_mouse_position()
	return a.global_position.distance_to(mouse_pos) < b.global_position.distance_to(mouse_pos)

func take_dmg(dmg):
	Health.change_health(dmg)
