extends Node2D

var speed = 200
var direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += speed*direction*delta



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == '角色':
		queue_free()
		body.go_big()
	else:
		direction = -direction
