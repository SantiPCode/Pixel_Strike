extends "res://scripts/weapon.gd"

func _ready() -> void:
	# Sobrescribir las variables específicas de la pistola
	magazine_size = 12
	reload_time = 1.5
	fire_rate = 0.2
	current_ammo = magazine_size





















'''@onready var muzzle = $muzzle
@export var BULLET = preload("res://Scenes/bullet.tscn")
@export var magazine_size: int = 10 #Tamaño del cargador
@export var reload_time: float = 2.0 #Tiempo de recarga

var current_ammo: int #Balas actuales en el cargador
var is_reloading: bool = false #Estado de recarga
var can_shoot = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_ammo = magazine_size #Inicializa las balas del cargador

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot and not is_reloading:
		if current_ammo > 0:
			shoot()
			current_ammo -=1
		else:
			print("Sin balas, recarga manual necesaria.")
	elif Input.is_action_just_pressed("reload") and not is_reloading:
		reload()

				
func shoot():
		var bullet = BULLET.instantiate()
		get_tree().root.add_child(bullet)
		bullet.global_position = $muzzle.global_position
		var direction = (get_global_mouse_position() - $muzzle.global_position).normalized()
		bullet.velocity = direction
		
func reload():
	if current_ammo < magazine_size:
		is_reloading = true
		can_shoot = false
		print("Recargando...")
		await get_tree().create_timer(reload_time).timeout #Espera el tiempo de recarga
		current_ammo = magazine_size
		print("Recarga completa.")
		is_reloading = false
		can_shoot = true
	else:
		print("Cargador ya está lleno.")func _ready() -> void:'''

		
