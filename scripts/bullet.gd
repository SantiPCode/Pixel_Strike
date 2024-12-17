extends Area2D

const SPEED = 800


func _process(delta: float) -> void:
	position += transform.x * SPEED * delta
