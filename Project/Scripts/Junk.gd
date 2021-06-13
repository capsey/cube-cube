extends RigidBody2D

func _ready():
	rotation = rand_range(0, PI * 2)
	linear_velocity = Vector2(rand_range(-50, 50), rand_range(-50, 50))
