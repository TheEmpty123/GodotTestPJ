extends LevelParent

@export var outside_scene: PackedScene

func _on_area_2d_body_entered(_body):
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Ground/TileMap2, "layer_0/modulate:a", 0, 0.5)
	tween.tween_property($Ground/CeilingHole1, "modulate:a", 0,0.5)


func _on_area_2d_body_exited(_body):
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Ground/TileMap2, "layer_0/modulate:a", 1, 0.5)
	tween.tween_property($Ground/CeilingHole1, "modulate:a", 1,0.5)

func _on_door_player_connected(_body):
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Ground/door, "position", Vector2(13668,2354), 0.5)
	tween.tween_property($Ground/door, "rotation", deg_to_rad(0), 0.5)


func _on_door_2_player_connected(_body):
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Ground/door2, "position", Vector2(14042, 328), 0.5)
	tween.tween_property($Ground/door2, "rotation", deg_to_rad(-165), 0.5)

func _on_area_2d_2_body_entered(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	get_tree().change_scene_to_packed(outside_scene)

