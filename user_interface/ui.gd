extends CanvasLayer

# colors
var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0 , 0, 1)

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health: TextureProgressBar = $MarginContainer/TextureProgressBar


func _ready():
	Global.connect("update_stat", update_ui)
	update_ui()
	

func update_laser_text():
	laser_label.text = str(Global.laser_amount)
	update_color(Global.laser_amount, laser_label, laser_icon)
	

func update_grenade_text():
	grenade_label.text = str(Global.grenade_amount)
	update_color(Global.grenade_amount, grenade_label, grenade_icon)
	

func update_health_bar():
	var tween = create_tween()
	tween.tween_property($MarginContainer/TextureProgressBar, "value", Global.health_points, 0.2)
	

func update_color(a: int, label: Label, icon: TextureRect) -> void:
	if a > 0:
		label.modulate = green
		icon.modulate = green
	else:
		label.modulate = red
		icon.modulate = red

func update_ui():
	update_grenade_text()
	update_laser_text()
	update_health_bar()
	
