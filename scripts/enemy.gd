extends CharacterBody2D

"@export var health_script: NodePath"
@export var health: int = 100  # Salud del enemigo
@export var speed: int = 200
@export var speed_walk: int = 50



"# Método para recibir daño
func take_damage(amount: int) -> void:
	var health = get_node(health_script)
	health.take_damage(amount)"



# Método para curarse
'''func heal(amount):
	current_hp += amount
	current_hp = clamp(current_hp, 0, max_hp)  # Asegura que no pase del máximo
	print("HP:", current_hp)'''




# Método para recibir daño
func take_damage(amount: int) -> void:
	health -= amount  # Resta la cantidad de daño
	if health <= 0:
		die()  # Si la salud es 0 o menos, el enemigo muere

# Método para manejar la muerte del enemigo
func die() -> void:
	queue_free()  # Elimina al enemigo de la escena

	
