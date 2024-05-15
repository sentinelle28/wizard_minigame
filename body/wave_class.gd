extends Node

class_name Wave_Class
var wave_content = {"demon":0,"zombie":0,"goblin":0,"orc":0}
func _init(demon,zombie,goblin,orc):
	wave_content["demon"]=demon
	wave_content["zombie"]=zombie
	wave_content["goblin"]=goblin
	wave_content["orc"]=orc
		
func spawn_a_mob():
	var lsit = []
	for key in wave_content:
		if wave_content[key] > 0:
			lsit.append(key)
		
		
	var choice = lsit.pick_random()
	wave_content[choice] -= 1
	return choice

func sum_enemy():
	var sumi = 0
	for key in wave_content:
		sumi += wave_content[key]
	return sumi
