extends "res://Scripts/Cube.gd"

# PUBLIC
export var acceleration: float

# PRIVATE METHODS
func _on_start_rocket(delta, direction: Vector2, body: RigidBody2D):
	body.apply_central_impulse(direction * acceleration * delta)
	body.add_fuel(-delta * direction.length())
