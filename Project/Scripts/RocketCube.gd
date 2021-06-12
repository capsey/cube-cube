extends CollisionShape2D

# PUBLIC
export var player_path: NodePath
export var acceleration: float
export var mass: float

# PRIVATE
var player: RigidBody2D

# PRIVATE METHODS
func _ready():
	player = get_node(player_path)
	player.add_cube(self)

func _on_start_rocket(delta, direction, body: RigidBody2D):
	body.apply_central_impulse(direction * acceleration * delta)

func _on_area_entered(area: Area2D):
	if area.get_parent().has_method("connect_rocket_cube"):
		area.get_parent().connect_rocket_cube(player)
