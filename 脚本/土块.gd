extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pz_disable():
	self.collision_layer = 0
	self.collision_mask = 0

func pz_able():
	self.collision_layer = 1
	self.collision_mask = 1
