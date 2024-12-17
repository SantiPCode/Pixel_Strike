extends CharacterBody2D

@export var speed: int = 200
const bullet = preload("res://Scenes/bullet.tscn")

func _physics_process(delta: float) -> void:
	movement()
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = bullet.instantiate()
		get_tree().root.add_child(bullet_instance)
		bullet_instance.global_position = global_position
		bullet_instance.rotation = rotation
	
	
func movement():
	velocity = Input.get_vector("move_left","move_right","move_up","move_down") * speed
	move_and_slide()
