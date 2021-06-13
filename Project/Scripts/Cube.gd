extends CollisionShape2D

# PUBLIC
export var player_path: NodePath
export var mass: float
export var fuel: float

# PRIVATE
var player: RigidBody2D

# PRIVATE METHODS
func _ready():
	player = get_node(player_path)
	player.add_cube(self)

func destroy():
	var explosion = load("res://Objects/Explosion.tscn")
	var instance: Node2D = explosion.instance()
	get_parent().get_parent().add_child(instance)
	instance.global_position = global_position
	
	queue_free()

func _on_area_entered(area: Area2D):
	if area.get_parent().has_method("connect_rocket_cube"):
		area.get_parent().connect_rocket_cube(player)
