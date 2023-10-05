extends Area2D

var direction: Vector2 = Vector2.ZERO
var speed = 2000

func _process(delta):
	position += direction * speed * delta
