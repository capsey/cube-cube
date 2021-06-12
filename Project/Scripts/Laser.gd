tool
extends Area2D

# PUBLIC
export var length: float
export var timer: float

# PRIVATE
var collision: CollisionShape2D
var line: Line2D

# PRIVATE METHODS
func _ready():
	collision = get_node("CollisionShape2D")
	line = get_node("Line2D")
	
	if Engine.editor_hint: return
	get_node("Timer").wait_time = timer

func _process(delta):
	if not Engine.editor_hint: return
	_ready()
	
	update_laser(length)

func _on_body_shape_entered(_body_id, body: RigidBody2D, body_shape, _local_shape):	
	if Engine.editor_hint: return
	
	if body.has_method("remove_cube"):
		body.remove_cube(body.get_child(body_shape))
		print(name + ": " + body.get_child(body_shape).name + " have been destroyed")

func _on_Timer_timeout():
	line.visible = not line.visible
	monitoring = not monitoring
	

# PUBLIC METHODS
func update_laser(length: float):
	collision.shape.length = length
	
	line.clear_points()
	line.add_point(Vector2.ZERO)
	line.add_point(Vector2.DOWN * length)
