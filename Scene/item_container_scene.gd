extends LevelParent
class_name object

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
var opened: bool = false
signal open(pos, dir)
