extends KinematicBody2D

var velocity = Vector2()

const SPEED = 300
const GRAVITY = 1000
const JUMP_FORCE = -400

func _physics_process(delta):
	# Gravity
	if !is_on_floor():
		velocity.y += GRAVITY * delta

	# Movement
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	else:
		velocity.x = 0

	# Jump
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_FORCE

	velocity = move_and_slide(velocity, Vector2.UP)
