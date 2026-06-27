extends KinematicBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 980.0
var velocity = Vector2()


func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Left/Right Movement
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide(velocity)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
var SPEED = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1

	velocity = velocity.normalized() * SPEED
	move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
