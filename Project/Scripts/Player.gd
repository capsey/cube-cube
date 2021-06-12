extends RigidBody2D

# SIGNALS
signal rocket(delta, direction, body)

signal center_changed(new_center)
signal fuel_changed(value, max_f)

# PRIVATE
var _cubes: Array

var _max_fuel: float
var _fuel: float

# PRIVATE METHODS
func _process(delta):
	var direction = _get_input()
	
	if direction == Vector2.ZERO: return
	if _fuel <= 0: return
	
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
	
	return direction.normalized()

func _update_center():
	var center = Vector2.ZERO
	
	if(_cubes.size() == 0):
		emit_signal("center_changed", center)
		return center
	
	var x = 0
	var y = 0
	
	for c in _cubes:
		x += c.position.x
		y += c.position.y
	
	center = Vector2(x / _cubes.size(), y / _cubes.size())
	
	emit_signal("center_changed", center)
	return center

# PUBLIC METHODS
func set_fuel(amount: float):
	_fuel = amount
	
	if _fuel < 0:
		_fuel = 0
		print("Game Over!")
	
	emit_signal("fuel_changed", _fuel, _max_fuel)

func add_fuel(amount: float):
	set_fuel(_fuel + amount)

func add_cube(cube):
	connect("rocket", cube, "_on_start_rocket")
	mass += cube.mass
	
	_cubes.append(cube)
	_update_center()
	
	_max_fuel += cube.fuel
	add_fuel(cube.fuel)
	
	print(name + ": " + cube.name + " succesfully connected!")

func remove_cube(cube):	
	mass -= cube.mass
	
	_max_fuel -= cube.fuel
	var k = float(_cubes.size() - 1) / float(_cubes.size())
	var new_fuel = _fuel * k
	set_fuel(new_fuel)
	
	_cubes.remove(_cubes.find(cube))
	var center = _update_center()
	
	var impulse = center - cube.position
	linear_velocity = impulse.normalized() * 200
	
	cube.destroy()
	
	if _cubes.size() == 0:
		linear_velocity = Vector2.ZERO
