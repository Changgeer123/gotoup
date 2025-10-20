extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == '角色':
		fenshens()

		

func fenshens():
	var fs = preload("res://场景/小世界合集/幸福小区/分身肉团/分身肉团.tscn").instantiate()
	get_parent().add_child(fs)
	fs.global_position = global_position
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == '分分神':
		fenshens()
