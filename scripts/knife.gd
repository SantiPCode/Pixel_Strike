extends "res://scripts/weapon.gd"

func _ready() -> void:
	# Sobrescribir las variables específicas de la pistola
	magazine_size = 1
	reload_time = 1.5
	fire_rate = 1
	current_ammo = magazine_size
