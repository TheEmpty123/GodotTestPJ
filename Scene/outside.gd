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
