extends RigidBody2D

# PUBLIC
export var connecting_cube: Resource

# PRIVATE METHODS
func _ready():
	linear_velocity = Vector2(randf(), randf()) * 10

func _snap_position(center: Vector2):
	var result = position - center
	
	var snap = 65
	result.x = round(result.x / snap) * snap
	result.y = round(result.y / snap) * snap
	
	return result

# PUBLIC METHODS
func connect_rocket_cube(player: RigidBody2D):
	var instance: Node2D = connecting_cube.instance()
	
	player.call_deferred("add_child", instance)
	
	instance.player_path = player.get_path()
	instance.position = _snap_position(player.position)
	
	queue_free()

func destroy():
	var explosion = load("res://Objects/Explosion.tscn")
	var instance: Node2D = explosion.instance()
	get_parent().add_child(instance)
	instance.global_position = global_position
	
	queue_free()
