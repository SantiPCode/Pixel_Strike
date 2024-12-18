extends Area2D

var speed = 500
var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
