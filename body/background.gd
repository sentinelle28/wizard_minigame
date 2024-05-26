extends AudioStreamPlayer

func _ready():
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Wave.is_continuing == false:
		stop()


func _on_finished():
	await get_tree().create_timer(3).timeout
	play()
