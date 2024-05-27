extends Node2D

var child_list = []
@export var wave_displayer:AnimatedSprite2D

func _ready():
	for child in get_children():
		child_list.append(child)
	await get_tree().create_timer(3).timeout
	reset()

func start_wave(n):
	var waver = Wave.wave[n]
	var copy_wave = Wave_Class.new(waver.wave_content["demon"],
	waver.wave_content["zombie"],
	waver.wave_content["goblin"],
	waver.wave_content["orc"])
	while copy_wave.sum_enemy() > 0 and Wave.is_continuing:
		if Wave.is_playing:
			var spawner_choosed = child_list.pick_random()
			$"../monster_coming_animator".play(spawner_choosed.name)
			spawner_choosed.activate(copy_wave.spawn_a_mob())
			await get_tree().create_timer(randf_range(1.0,3.0)).timeout 
		else:
			$"../monster_coming_animator".stop()
			$"../monster_coming_animator".play("true_reset")
			await get_tree().create_timer(2).timeout
			Wave.is_playing = true

	

func reset():
	
	
	
	for i in range(20):
		Wave.current_wave = i
		wave_displayer.set_frame_and_progress(i,0)
		
		
		start_wave(i)
		if Wave.is_continuing == false:
			break
		Wave.is_playing = false
		
		await get_tree().create_timer(randf_range(10.0,12.0)).timeout  
		$"../wave_animator".play("changing_wave")
		await get_tree().create_timer(1.6).timeout
		Wave.is_playing = true

func clear_enemy():
	for child in child_list:
		for enemy_child in child.get_children():
			if enemy_child is enemy:
				child.remove_child(enemy_child)

