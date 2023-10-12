extends CharacterBody2D

@export var max_speed: int = 1000
var speed: int = max_speed
var can_shoot: bool = true
var can_grenade: bool = true

signal laser_input(pos, dir)
signal grenade_input(pos, dir)
signal update_stats

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	# rotate player
	look_at(get_global_mouse_position())
	
	#Input
	var direction = Input.get_vector("left","right","up","down")
	var dir = (get_global_mouse_position() - position).normalized()
	velocity = direction * speed
	move_and_slide()
	
	#Shoot laser
	if Input.is_action_pressed("primary action") and can_shoot and Global.laser_amount > 0:
		Global.laser_amount -= 1
		var markers = $Markers.get_children()
		var selected_marker = markers[randi() % markers.size()]
		var pos = selected_marker.global_position
		can_shoot = false
		$ShootTimer.start()
		$GPUParticles2D.emitting = true
		$GPUParticles2D.process_material.angle_min = 270 - rad_to_deg(dir.angle())
		$GPUParticles2D.process_material.angle_max = 270 -  rad_to_deg(dir.angle())
		laser_input.emit(pos, dir)
	
	if Input.is_action_pressed("secondary action") and can_grenade and Global.grenade_amount > 0:
		Global.grenade_amount -= 1
		var markers = $Markers.get_children()
		var selected_marker = markers[randi() % markers.size()]
		var pos = selected_marker.global_position
		can_grenade = false
		$GrenadeTimer.start()
		grenade_input.emit(pos, dir)

func _on_shoot_timer_timeout():
	can_shoot = true

func _on_grenade_timer_timeout():
	can_grenade = true
