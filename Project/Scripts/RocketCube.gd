extends "res://Scripts/Cube.gd"

# SIGNAL
signal change_fire(direction)

# PUBLIC
export var acceleration: float

# PRIVATE METHODS
func _on_start_rocket(delta, direction: Vector2, body: RigidBody2D):
	body.apply_central_impulse(direction * acceleration * delta)
	
	emit_signal("change_fire", direction)
	
	var fuel_usage = delta * direction.length()
	if fuel_usage == 0: return
	body.add_fuel(-fuel_usage)
