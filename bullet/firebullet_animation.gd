extends AnimationPlayer

func _ready():
	get_parent().connect("death",death)
	
func death():
	play("finish")
