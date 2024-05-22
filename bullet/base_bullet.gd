extends CharacterBody2D
class_name bullet_player
@export var type:String
@export var damage:float
@export var time_before_death:float = 0
signal  death

@export var SPEED = 400
var direction 


func _process(delta):
	velocity = direction * SPEED * delta
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body is enemy:
		body.take_dmg(damage,type)
		emit_signal("death")
		await get_tree().create_timer(time_before_death).timeout
		queue_free()
		


func _on_timer_timeout():
	queue_free()
