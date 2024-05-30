extends CharacterBody2D

@export var spawn_location : Array[Node2D]
@onready var animator = $AnimationPlayer
@export var spellsound : AudioStreamPlayer
@export var current_spell:AnimatedSprite2D
func _ready():
	for child in get_children():
		if "shoot" in child.name:
			spawn_location.append(child)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_direction()
	update_spell()
	shoot()
	main_menu()
		
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
	current_spell.set_frame_and_progress(Currentspell.currentspell,0)
	
	
func shoot():
	if Input.is_action_just_pressed("shoot"):
		spellsound.stop()
		spellsound.play()
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
	if Health.health > 1:
		$AnimationPlayer.play("hurt")
	else:
		$AnimationPlayer.play("critacally_hurt")

func reset():
	show()
	$AnimationPlayer.play("RESET")

func main_menu():
	if Input.is_action_just_pressed("return"):
		reset()
		Wave.is_playing = true
		Wave.is_continuing = true
		Health.health = 3
		
		
		#score reset
		PlayerPoint.point = 0
		PlayerPoint.reset()
		
		
		
		get_tree().change_scene_to_file("res://menu/main.tscn")
