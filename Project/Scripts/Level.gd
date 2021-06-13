tool
extends Area2D

export var extents: Vector2

var camera: Camera2D
var bounds: Vector2

func _ready():
	camera = get_parent().get_node("Main Camera")
	get_node("Bounds").shape.extents = extents
	bounds = get_node("Bounds").shape.extents

func _process(delta):
	if not Engine.editor_hint: return
	get_node("Bounds").shape.extents = extents

func _on_body_exited(body: RigidBody2D):
	if Engine.editor_hint: return
	
	if body.has_method("disable"):
		body.disable()
		camera.set_process(false)
