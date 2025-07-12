extends RigidBody2D
class_name Bullet

@export var speed = 1000

func _init() -> void:
	apply_impulse(Vector2.UP * speed)
