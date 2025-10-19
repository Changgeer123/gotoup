extends Node2D

#/root/Node2D/CanvasLayer

func _on_area_2d_body_entered(body: Node2D) -> void:
	var tishi = preload("res://场景/道具/成功提示.tscn").instantiate()
	get_node('/root/Node2D/UI').add_child(tishi)
