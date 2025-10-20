extends Area2D

var player
var car
var stop = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($"../../矿车".global_position)
	pass # Replace with function body.

#锁住主角的位置
func _process(delta: float) -> void:
	if player and stop:
		if player.scale.x >= 0.02:
			player.scale *= Vector2(0.99, 0.99)
			player.get_node('Camera2D').zoom *= 1.01
		else:
			gogo()
		if car and stop:
			player.global_position = car.global_position


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().name == '矿车':
		area.get_parent().stop = true
		car = area.get_parent()
		
		for i in range(10):
			await get_tree().create_timer(0.4).timeout
			fenlie()
	

func _on_body_entered(body: Node2D) -> void:
	player = body

func gogo():
	stop = false
	player.global_position = get_node('/root/Node2D/双重幻影').global_position
	player.scale = Vector2(1, 1)
	player.get_node('Camera2D').zoom = Vector2(1, 1)

func fenlie():
	var fenshen = preload("res://场景/角色/分身.tscn").instantiate()
	add_child(fenshen)
	fenshen.global_position = $"../../矿车".global_position+Vector2(20,20)
	fenshen.scale = player.scale
	fenshen.direction.x = 1
	await get_tree().create_timer(1.0).timeout
	fenshen.queue_free()
