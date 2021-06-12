extends Node

# PUBLIC
export var player_path: NodePath

# PRIVATE
var player: Node

var fuel_bar: ProgressBar
var label: Label

# PRIVATE METHODS
func _ready():
	player = get_node(player_path)
	player.connect("fuel_changed", self, "_on_fuel_changed")
	
	fuel_bar = get_node("ProgressBar")
	label = get_node("ProgressBar/Label")

func _on_fuel_changed(value, max_fuel):
	fuel_bar.max_value = max_fuel
	fuel_bar.value = value
	
	label.text = str(round(value)) + " / " + str(max_fuel)
