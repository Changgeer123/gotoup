extends Node2D

var bo

var to = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print($"分身".global_position, 'sss')
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if to:
		return
	if bo:
		check()



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == '角色':
		bo = body
		body.loseg = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == '角色':
		body.loseg = false

func check():
	if bo.scale.x >= 3.0:
		together()
		to = true

func together():
	$".".queue_free()
	get_node('/root/Node2D/角色').scale = Vector2(1,1)
	get_node('/root/Node2D/角色/Camera2D').zoom = Vector2(1,1)
