extends Line2D

# PUBLIC
export var sprite_0: Texture
export var sprite_1: Texture

# PRIVATE
var first = false

# PRIVATE METHODS
func _set_sprite():
	first = not first
	
	if first:
		texture = sprite_0
	else:
		texture = sprite_1
