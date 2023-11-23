extends CharacterBody2D

# Inspector Variables
@export var crouchSpeed := 10
@export var walkSpeed := 50
@export var sprintSpeed := 100

@onready var animations = $AnimationPlayer

var speed := 0

var isSprinting := false
var isCrouching := false

func getInput():
	var inputVec := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	setSpeed()
	velocity = inputVec * speed
	
func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var dir = "Down"
		if velocity.x < 0:
			dir = "Left"
		elif velocity.x > 0:
			dir = "Right"
		elif velocity.y < 0:
			dir = "Up"
		
		if isCrouching:
			animations.play("Crouch" + dir)
		elif isSprinting:
			animations.play("Sprint" + dir)
		else:
			animations.play("Walk" + dir)

func setSprint():
	isCrouching = false
	isSprinting = true
	
func setCrouch():
	isCrouching = true
	isSprinting = false
	
func setWalk():
	isCrouching = false
	isSprinting = false

func setSpeed():
	if Input.is_action_pressed("ui_space"):
		speed = crouchSpeed
		setCrouch()
	else:
		if Input.is_action_pressed("ui_shift"):
			speed = sprintSpeed
			setSprint()
		else: 
			speed = walkSpeed
			setWalk()
			


func _physics_process(_delta):
	getInput()
	move_and_slide()
	updateAnimation()
