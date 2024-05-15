extends Node2D

var child_list = []

func _ready():
	for child in get_children():
		child_list.append(child)
	await get_tree().create_timer(3).timeout
	for i in range(20):
		start_wave(i)
		await get_tree().create_timer(randf_range(1.0,3.0)).timeout   

func start_wave(n):
	var waver = Wave.wave[n]
	var copy_wave = Wave_Class.new(waver.wave_content["demon"],
	waver.wave_content["zombie"],
	waver.wave_content["goblin"],
	waver.wave_content["orc"])
	while copy_wave.sum_enemy() > 0 and Wave.is_playing:
		child_list.pick_random().activate(copy_wave.spawn_a_mob())
		await get_tree().create_timer(randf_range(1.0,3.0)).timeout 
		
