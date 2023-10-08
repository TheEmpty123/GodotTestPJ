extends Area2D

var direction: Vector2 = Vector2.ZERO
var speed = 2000

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free()

func _on_timer_timeout():
	print("destroy")
	queue_free()
