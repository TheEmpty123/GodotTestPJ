extends object

# Called when the node enters the scene tree for the first time.
func hit():
	if not opened:
		opened = true
		$LidSprite.hide()
		for i in range(3):
			var pos = $SpawnPosition.get_child(randi()%$SpawnPosition.get_child_count()).global_position
			open.emit(pos, current_direction)
	
