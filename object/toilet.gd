extends object

func hit():
	if not opened:
		opened = true
		$LidSprite.hide()
		for i in range(2):
			var pos = $SpawnPosition/Marker2D.global_position
			open.emit(pos, current_direction)
