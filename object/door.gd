extends StaticBody2D

signal player_connected

func _on_area_2d_body_entered(body):
	player_connected.emit(body)
