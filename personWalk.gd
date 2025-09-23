extends Node2D

@onready var anim = $AnimationPlayer
@onready var timer = $WaitTimer
@onready var walk1 = $"../Walk1"
@onready var walk2 = $"../Walk2"
@onready var body = $Body

@export var speed = 1
@export var waitTime = 3.000
@export var runSpeed = 2

var currentSpeed = speed

var direction = 1
var waiting = false

enum STATES {walk,run,stand}
var state: STATES = STATES.stand

func _process(_delta: float) -> void:

	position.x += currentSpeed

	if direction > 0 && waiting == false:
		currentSpeed = abs(speed)
	elif direction < 0 && waiting == false:
		currentSpeed = abs(speed) * -1
	elif waiting == true:
		currentSpeed = 0

	_state_checker()

	if position.x > walk2.position.x:
		pauseWalk()
		position.x -= speed * 2
	if position.x < walk1.position.x:
		pauseWalk()
		position.x += speed * 2

func _state_checker():

	if abs(currentSpeed) > 0.3 && abs(speed) < runSpeed:
		state = STATES.walk
	elif abs(currentSpeed) >= runSpeed:
		state = STATES.run
	elif abs(currentSpeed) < 0.3:
		state = STATES.stand

	if direction > 0:
		body.scale.x = 1
	elif direction < 0:
		body.scale.x = -1

	if state == STATES.walk:
		anim.play("walk")
	elif state == STATES.stand:
		anim.play("idle")
	elif state == STATES.run:
		anim.play("run")

	if anim.current_animation == "walk":
		anim.speed_scale = speed
	else:
		anim.speed_scale = 1

func _on_wait_timer_timeout() -> void:
	waiting = false

func pauseWalk():
	waiting = true
	timer.start(waitTime)
	direction *= -1
