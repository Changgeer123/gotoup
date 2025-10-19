extends Area2D

var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_path())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../可移动土块".global_position.y <= global_position.y-420:
		$"../可移动土块".direction.y = 0



func _on_body_entered(body: Node2D) -> void:
	two(body)
	up_to()

func two(body):
	var fenshen = preload("res://场景/角色/分身.tscn").instantiate()
	body.add_child(fenshen)
	fenshen.position = Vector2(0, -200)
	var pz = body.get_node('CollisionShape2D').duplicate()
	body.add_child(pz)
	pz.position = Vector2(0, -200)
	print(pz.name)
	
func up_to():
	$"../可移动土块".direction.y = -1
