extends RigidBody2D

# SIGNALS
signal rocket(delta, direction, body)

signal center_changed(new_center)

# PRIVATE
var offset: Vector2
var _cubes: Array

# PRIVATE METHODS
func _process(delta):
	var direction = _get_input()
	emit_signal("rocket", delta, direction, self)

func _get_input():
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	return direction

func _update_center():
	var center = _cubes[0].position
	
	if(_cubes.size() <= 1):
		return center
	
	for i in range(1, _cubes.size()):
		center = _middle_point(center, _cubes[i].position)
	
	emit_signal("center_changed", center)

func _middle_point(a: Vector2, b: Vector2):
	var result = Vector2.ZERO
	
	result.x = (a.x + b.x) / 2
	result.y = (a.y + b.y) / 2
	
	return result

# PUBLIC METHODS
func add_cube(cube: CollisionShape2D):
	connect("rocket", cube, "_on_start_rocket")
	mass += cube.mass
	
	_cubes.append(cube)
	_update_center()
	
	print(name + ": " + cube.name + " succesfully connected!")
