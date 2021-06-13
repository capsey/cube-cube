extends "res://Scripts/ComponentCube.gd"

export var cubes_count: int
export var next_scene: Resource

func _ready():
	if cubes_count <= 0: push_error("Cubes Count can't be 0 or less!")

func _on_area_entered(area):
	print("You won! Hooray!")
	
	var player = area.get_parent().get_parent()
	if not player.has_method("you_won"): return
	
	player.you_won()
	
	var instance = load("res://Objects/Win Screen.tscn").instance()
	get_parent().add_child(instance)
	instance.init(player._cubes.size(), cubes_count, next_scene)
