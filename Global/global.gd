extends Node

signal update_stat

var laser_amount = 20:
	set(value):
		laser_amount = value
		update_stat.emit()
var grenade_amount = 5:
	set(value):
		grenade_amount = value
		update_stat.emit()
var health_points = 50:
	set(value):
		health_points = value
		update_stat.emit()
