extends Node2D

@export var BULLET = preload("res://Scenes/bullet.tscn")  # Bala asociada al arma
@export var magazine_size: int = 10  # Tamaño del cargador
@export var reload_time: float = 2.0  # Tiempo de recarga
@export var fire_rate: float = 0.2  # Cadencia de disparo
@export var recoil: float = 0.08 #Recoil máximo ángulo de desviación (en radianes)
@onready var muzzle = $muzzle  # Punto de disparo

var current_ammo: int
var is_reloading: bool = false
var can_shoot: bool = true

func _ready() -> void:
	current_ammo = magazine_size

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot and not is_reloading:
		if current_ammo > 0:
			shoot()
			current_ammo -= 1
		else:
			reload()

	if Input.is_action_just_pressed("reload") and not is_reloading:
		reload()

func shoot():
	var bullet = BULLET.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_position = muzzle.global_position
	
	# Calcular dirección inicial con recoil
	var base_direction = (get_global_mouse_position() - muzzle.global_position).normalized()
	var recoil_angle = randf_range(-recoil, recoil)  # Ángulo aleatorio basado en recoil
	var direction_with_recoil = base_direction.rotated(recoil_angle)
	
	#Asignar la velocidad/dirección a la bala
	bullet.velocity = direction_with_recoil * bullet.speed

	can_shoot = false
	await get_tree().create_timer(fire_rate).timeout  # Temporizador de cadencia
	can_shoot = true

func reload():
	if current_ammo < magazine_size:
		is_reloading = true
		can_shoot = false
		print("Recargando...")
		await get_tree().create_timer(reload_time).timeout
		current_ammo = magazine_size
		print("Recarga completa.")
		is_reloading = false
		can_shoot = true
