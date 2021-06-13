extends AnimatedSprite

func _ready():
	get_node("Timer").start()
	play()

func _on_Timer_timeout():
	queue_free()
