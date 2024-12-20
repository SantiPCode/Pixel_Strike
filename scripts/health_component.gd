extends Area2D
class_name HealthComponent

signal onDead
signal onDamageTook(amount: int)

@export var max_hp: int = 100
var current_hp: int = 0

func _ready() -> void:
	current_hp = max_hp

#la funcion se encarga de calcular el daño
func take_damage(damage: int):
	var value = abs(damage)
	set_health(-value)
	emit_signal("onDamageTook", damage)
	

func set_health(value : int) -> void:
	current_hp += value
	current_hp = clamp(current_hp, 0, max_hp)
	
	if current_hp <= 0:
		dead()
		

	

func dead() -> void:
	emit_signal("onDead")
	get_parent().queue_free()
