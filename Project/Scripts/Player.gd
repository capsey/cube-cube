extends RigidBody2D

# SIGNALS
signal rocket(delta, direction, body)

# PRIVATE METHODS
func _ready():
	pass

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
