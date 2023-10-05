extends Node2D

var laser_scene: PackedScene = preload("res://object/laser.tscn")
var grenade_scene: PackedScene = preload("res://object/grenade.tscn")

func _on_door_player_connected(body):
	print("Succeed!")
	body.position.y -= 200

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
