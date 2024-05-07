extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_direction()
		
func change_direction():
	var direction = sign(global_position-get_global_mouse_position())
	if direction == Vector2(1,-1) or direction == Vector2(1,1):
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	
