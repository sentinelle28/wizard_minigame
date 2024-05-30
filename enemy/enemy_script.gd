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
	var direction = global_position.direction_to(player.global_position)
	if direction.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	Health.connect("take_dmg",repise)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = global_position.direction_to(nav.get_next_path_position())
	translate(direction*delta*speed)
	
func take_dmg(dmg,type):
	EnemyHurt.play()
	var dmg_received = find_type(type)*dmg 
	if dmg_received == 0:
		var immune = load("res://body/immune_label.tscn").instantiate()
		add_child(immune)
		immune.global_position = global_position + Vector2(0,-10)
	
	else:
		health -= dmg_received
		$AnimationPlayer.play("hurt")
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


func _on_area_2d_body_entered(body):
	if body.name == "player":
		
		body.take_dmg(1)
		queue_free()
		

func repise():
	queue_free()
