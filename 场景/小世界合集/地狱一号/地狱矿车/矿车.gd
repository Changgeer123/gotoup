extends Node2D

@export var speed: float = 0.0  # 前进速度

var have_people = null

var stop = true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# 自动沿着自身旋转角度的正前方前进
	if stop:
		return
	var forward_direction = Vector2.RIGHT.rotated(rotation)
	position += forward_direction * speed * delta

	if have_people:
		have_people.global_position = global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == '角色':
		speed = 300.0
		stop = false
		#body.global_position = global_position
		have_people = body
