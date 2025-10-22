extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var gravity = Vector2(0.0, 980.0)
var direction = 0

#不能控制
var stop = false

#失重
var loseg = false

func _ready() -> void:
	print(get_path())

func _physics_process(delta: float) -> void:
	# Add the gravity.

	if stop:
		move_and_slide()
		return
		
	if not is_on_floor() and not loseg:
		velocity += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor() and not loseg:
			velocity.y = JUMP_VELOCITY
			velocity.x = direction * SPEED
		elif loseg:
			velocity.y = -1 * SPEED
	elif Input.is_action_just_pressed("ui_down"):
		if loseg:
			velocity.y = SPEED
	elif loseg and not (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")):
		# 在失重状态下，当没有按下上下键时，垂直速度逐渐归零
		velocity.y = move_toward(velocity.y, 0, SPEED)
			
	if velocity.x>0:
		$"人物".flip_h = false
		$walk.flip_h = false
		$jump.flip_h = false
	elif velocity.x<0:
		$"人物".flip_h = true
		$walk.flip_h = true
		$jump.flip_h = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_floor() or loseg:
		direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x == 0 and velocity.y == 0:
		$"人物".visible = true
		$walk.visible = false
		$jump.visible = false
	elif velocity.y == 0 and velocity.x != 0:
		$"人物".visible = false
		$walk.visible = true
		$jump.visible = false
	elif velocity.y != 0 and velocity.x != 0:
		$"人物".visible = false
		$walk.visible = false
		$jump.visible = true

	move_and_slide()

func go_big():
	scale *= 1.01
	$Camera2D.zoom *= 0.99
