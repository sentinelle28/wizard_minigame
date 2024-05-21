extends HBoxContainer

var list_child = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		list_child.append(child)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Health.health == 2:
		list_child[2].hide()
	elif Health.health == 1:
		list_child[1].hide()
	elif Health.health == 0:
		list_child[0].hide()
		get_tree().paused = true

func reset():
	for child in list_child:
		child.show()
