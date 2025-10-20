extends Node2D

var speed = 300
var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(global_position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += speed*direction*delta
