extends RigidBody2D

const speed = 500

func explode():
	$Explosion.visible = true
	$AnimationPlayer.play("Explosion")
