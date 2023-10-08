extends StaticBody2D

signal player_connected
@export var check: bool = true

func _on_area_2d_body_entered(body):
	if check:
		player_connected.emit(body)
		check = false
