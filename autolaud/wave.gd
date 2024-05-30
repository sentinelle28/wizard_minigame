extends Node

var is_continuing = true
var is_playing = true
var current_wave = 0
#demon,zombie,goblin,orc
var wave = [Wave_Class.new(0,0,4,0), #wave 0
Wave_Class.new(4,0,0,0),#wave 1
Wave_Class.new(0,4,0,0),#wave 2
Wave_Class.new(0,0,0,4),#wave 3
Wave_Class.new(2,0,4,0),#wave 4
Wave_Class.new(2,2,0,2),#wave 5
Wave_Class.new(0,0,10,0),#wave 6
Wave_Class.new(0,2,2,2),#wave 7
Wave_Class.new(5,0,0,5),#wave 8
Wave_Class.new(0,10,0,0),#wave 9
Wave_Class.new(3,0,7,3),#wave 10
Wave_Class.new(0,0,20,0),#wave 11
Wave_Class.new(10,10,0,0),#wave 12
Wave_Class.new(5,5,5,5),#wave 13
Wave_Class.new(0,10,0,10),#wave 14
Wave_Class.new(7,6,4,0),#wave 15
Wave_Class.new(0,9,4,8),#wave 16
Wave_Class.new(0,3,4,1),#wave 17
Wave_Class.new(20,0,0,0),#wave 18
Wave_Class.new(10,10,10,10),#wave 19

]



	
	
