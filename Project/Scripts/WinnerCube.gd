extends "res://Scripts/ComponentCube.gd"

func _on_area_entered(area):
	var player = area.get_parent().get_parent()
	if not player.has_method("you_won"): return
	
	player.you_won()
	print("You won! Hooray!")
