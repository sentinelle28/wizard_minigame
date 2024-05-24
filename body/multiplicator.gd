extends VBoxContainer
@export var point_label:Label
@export var mult_label:Label
@export var text_rect:TextureProgressBar
@export var animator :AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var point = str(PlayerPoint.point)
	if len(point) < 8:
		var miss_text = ""
		for i in range(8-len(point)):
			miss_text += "0"
		point = miss_text + point
	point_label.text = point
	text_rect.value = PlayerPoint.time_left_to_reset
	mult_label.text = str(PlayerPoint.current_mult)
	
	animator.play("mult_progress")
	animator.seek(PlayerPoint.current_mult/10)
	
	
