extends CanvasLayer

const first = 0
const second = 50
const third = 100

func init(cubes_count: int, max_cubes: int):
	var stars = 0
	var percent = (float(cubes_count) / float(max_cubes)) * 100
	
	if percent >= first: stars += 1
	if percent >= second: stars += 1
	if percent >= third: stars += 1
	
	get_node("TextureProgress").value = stars
	get_node("Cubes Count").text = str(cubes_count) + " / " + str(max_cubes)
