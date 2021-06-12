extends Node2D

# PUBLIC
export var connecting_cube: Resource

# PRIVATE METHODS
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
