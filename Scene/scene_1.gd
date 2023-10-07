extends Node2D

var laser_scene: PackedScene = preload("res://object/laser.tscn")
var grenade_scene: PackedScene = preload("res://object/grenade.tscn")

func _on_door_player_connected(_body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0)
	tween.tween_property($Player, "position:y", -150, 1)
	tween.tween_property($Player, "speed", 500, 0.5)

func _on_player_laser_input(pos, dir):
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.direction = dir
	laser.rotation = (dir - Vector2.ZERO).angle() + deg_to_rad(90)
	$Projectiles.add_child(laser)

func _on_player_grenade_input(pos, dir):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)
 
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
