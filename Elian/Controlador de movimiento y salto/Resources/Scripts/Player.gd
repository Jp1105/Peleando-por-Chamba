extends CharacterBody2D

const moveSpeed = 350
const maxSpeed = 350
const jumpHeight = -500
const gravity = 22

@onready var sprite = $Sprite2D
#@onready var animationPlayer = $AnimationPlayer



func _physics_process(_delta):
	velocity.y += gravity
	var friction = false

	if Input.is_action_pressed("move_right"):
		sprite.flip_h = true
		velocity.x = min(velocity.x + moveSpeed, maxSpeed)

	elif Input.is_action_pressed("move_left"):
		sprite.flip_h = false
		velocity.x = max(velocity.x - moveSpeed, -maxSpeed)

	else:
		friction = true

	if is_on_floor():
		if Input.is_action_pressed("move_jump"):
			velocity.y = jumpHeight
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.5)
	else:
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.01)

	move_and_slide()
