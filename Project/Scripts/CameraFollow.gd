extends Camera2D

# PUBLIC
export var target_path: NodePath

# PRIVATE
var _target: Node2D
var _offset: Vector2

# PRIVATE METHODS
func _ready():
	_target = get_node(target_path)

func _process(_delta):
	position = _target.position + _offset

# PUBLIC METHODS
func center_changed(new_center: Vector2):
	_offset = new_center
