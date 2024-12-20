extends Area2D
class_name HitboxComponent

@export var damage: int = 26

func _ready() -> void:
	area_entered.connect(hit)
	
func hit(area)-> void:
	
	if area and area is HealthComponent:
		area.take_damage(damage)
		get_parent().queue_free()
	print("impacto", damage)
	
	
	
# el hitbox detecta HealComponent



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
