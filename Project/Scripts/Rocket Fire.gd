extends AnimatedSprite

# PUBLIC
export var vertical: bool
export var negative: bool

# PRIVATE METHODS
func _ready():
	get_parent().connect("change_fire", self, "_rocket")

func _rocket(direction):
	var is_visible = false
	
	if vertical && (abs(direction.y) > 0.1):
		if negative && (direction.y < 0):
			is_visible = true
		if not negative && (direction.y > 0):
			is_visible = true
	
	if not vertical && (abs(direction.x) > 0.1):
		if negative && (direction.x < 0):
			is_visible = true
		if not negative && (direction.x > 0):
			is_visible = true
	
	visible = is_visible
