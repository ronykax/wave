extends CharacterBody2D

@export var speed: float = 400.0
@export var bullet_scene: PackedScene
@export var world: Node2D

@onready var bullet_spawner: Node2D = $BulletSpawner

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	shoot(delta)

func _physics_process(delta: float) -> void:
	move(delta)

func shoot(_delta):
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate() as Bullet
		bullet.position = bullet_spawner.global_position
		world.add_child(bullet)

func move(_delta: float):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
