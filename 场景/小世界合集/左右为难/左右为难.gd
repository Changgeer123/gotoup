extends Node2D

# 假设你有左右两个节点
@onready var left_node = $"左镜"  # 替换为你的左节点路径
@onready var right_node = $"右境"  # 替换为你的右节点路径

func _ready() -> void:
	# 初始化状态，比如默认显示左节点
	set_direction("left")

func _process(delta: float) -> void:
	# 检测输入
	if Input.is_action_pressed("ui_left"):
		set_direction("left")
	elif Input.is_action_pressed("ui_right"):
		set_direction("right")

# 设置方向函数
func set_direction(direction: String) -> void:
	match direction:
		"left":
			# 显示左节点，隐藏右节点
			left_node.visible = true
			right_node.visible = false
			
			for i in right_node.get_children():
				if i is StaticBody2D:
					i.pz_disable()
			
			for i in left_node.get_children():
				if i is StaticBody2D:
					i.pz_able()
			
		"right":
			# 显示右节点，隐藏左节点
			left_node.visible = false
			right_node.visible = true
			
			for i in left_node.get_children():
				if i is StaticBody2D:
					i.pz_disable()
			
			for i in right_node.get_children():
				if i is StaticBody2D:
					i.pz_able()

func pengzhuang_disable():
	for i in get_children():
		if i is StaticBody2D:
			i.pz_disable()
