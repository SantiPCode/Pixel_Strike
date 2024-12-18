extends CharacterBody2D

@export var speed: int = 200
@export var speed_walk: int = 50

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_vector * (speed_walk if Input.is_action_pressed("move_walk") else speed)
	move_and_slide()

func _process(delta: float) -> void:
	# Hace que el jugador mire hacia el mouse
	look_at(get_global_mouse_position())
