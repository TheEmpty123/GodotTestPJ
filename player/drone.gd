extends CharacterBody2D


const SPEED = 100
var direction: Vector2 = Vector2.ZERO

func _ready():
	direction = Vector2(1,0)
#	rotation_degrees = 90

func _process(delta):
	
	if direction.x == 1 && rotation_degrees < 90:
		rotation_degrees += 90 * delta * 2
	
	if direction.x == -1 && (rotation_degrees > 89 || rotation_degrees < -90):
		rotation_degrees += 90 * delta * 2
	
	if position.x > 1000:
		direction = Vector2(-1,0)

	else:
		if position.x < 100:
			direction = Vector2(1,0)
	
	velocity = direction * SPEED
	move_and_slide()
