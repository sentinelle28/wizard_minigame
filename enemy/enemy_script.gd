extends CharacterBody2D
class_name enemy

@export var health = 10
@export var player:CharacterBody2D
@export var speed = 200

@export var point_dropped = 10

@export var moon_weakness_mult = 2
@export var fire_weakness_mult = 0
@export var elec_weakness_mult = 1
@export var nature_weakness_mult = 1


@onready var nav = $NavigationAgent2D
var list_of_weakness

# Called when the node enters the scene tree for the first time.
func _ready():
	nav.target_position = player.global_position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = global_position.direction_to(nav.get_next_path_position())
	translate(direction*delta*speed)
	
func take_dmg(dmg,type):
	health -= find_type(type)*dmg
	if health<= 0:
		PlayerPoint.add_point(point_dropped)
		queue_free()
	
func find_type(type):
	match type:
		"fire":
			return fire_weakness_mult
		"freeze":
			speed *= 0.8
			return elec_weakness_mult
		"nature":
			return nature_weakness_mult
		"moon":
			return moon_weakness_mult
