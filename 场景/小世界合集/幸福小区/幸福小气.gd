extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print($"分身".global_position, 'sss')
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == '角色':
		body.loseg = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == '角色':
		body.loseg = false
