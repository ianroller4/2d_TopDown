extends CharacterBody2D

# Inspector Variables
@export var crouchSpeed := 100
@export var walkSpeed := 500
@export var sprintSpeed := 2000

var speed := 0

func getInput():
	var inputVec := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	setSpeed()
	velocity = inputVec * speed

func setSpeed():
	if Input.is_action_pressed("ui_space"):
		speed = crouchSpeed
	else:
		if Input.is_action_pressed("ui_shift"):
			speed = sprintSpeed
		else: 
			speed = walkSpeed

func _physics_process(_delta):
	getInput()
	move_and_slide()
