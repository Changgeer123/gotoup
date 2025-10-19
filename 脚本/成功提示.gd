extends Node2D


func _on_button_button_down() -> void:
	get_tree().reload_current_scene()
