extends Area2D

var rotation_speed: int = 4
var available_items = ['laser','grenade', 'health']
var type = available_items[randi()%len(available_items)]
var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1, 0.2, 0.5)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.5, 0.2, 0.1)
	if type == 'health':
		$Sprite2D.modulate = Color(0.1, 0.5, 0.2)
	
	#tween
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3).from(Vector2(0,0))

func _process(delta):
	rotation += rotation_speed * delta

func _on_body_entered(_body):
	if type == 'laser':
		Global.laser_amount += 10
	if type == 'grenade':
		Global.grenade_amount += 5
	if type == 'health':
		Global.health_points += 20
	
	queue_free()
