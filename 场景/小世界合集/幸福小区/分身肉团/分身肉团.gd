extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_children():
		i.direction = rand_dir()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func rand_dir():
	var dir = Vector2(0,0)
	dir.x = randi_range(-1, 1)
	dir.y = randi_range(-1, 1)
	return dir
