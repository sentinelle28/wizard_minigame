extends CharacterBody2D

@export var player:CharacterBody2D
@export var type:String
@export var damage:float

const SPEED = 300.0
var direction 

func _ready():
	direction = player.global_position.direction_to(global_position)

func _physics_process(delta):
	velocity.x = direction * SPEED
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name != "player" and body is enemy:
		body.take_dmg(damage,type)
		queue_free()
		
