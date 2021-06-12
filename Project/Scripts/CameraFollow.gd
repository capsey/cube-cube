extends Camera2D

# PUBLIC
export var target_path: NodePath
export(float, 0, 1) var smoothness: float

# PRIVATE
var target: Node2D

# PRIVATE METHODS
func _ready():
	target = get_node(target_path)

func _process(_delta):
	position = position.linear_interpolate(target.position, smoothness)
