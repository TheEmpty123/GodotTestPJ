extends LevelParent


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1)
	tween.tween_property($Player, "modulate:a", 0.5, 2)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 2)
	tween.tween_property($Player, "modulate:a", 1, 2)

func _on_door_player_connected(_body):
	pass # Replace with function body.

func _on_area_2d_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	get_tree().change_scene_to_file("res://Scene/inside.tscn")
	
