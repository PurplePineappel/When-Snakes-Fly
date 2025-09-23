extends Camera2D

@export var speed = 5
@export var zoomRate = 0.005

func _process(_delta: float) -> void:
	
	if Input.is_action_pressed("cameradown"):
		offset.y += speed
	if Input.is_action_pressed("cameraup"):
		offset.y -= speed
	if Input.is_action_pressed("cameraright"):
		offset.x += speed
	if Input.is_action_pressed("cameraleft"):
		offset.x -= speed

	if Input.is_action_pressed("zoomin"):
		zoom.x += zoomRate
		zoom.y += zoomRate
	if Input.is_action_pressed("zoomout"):
		zoom.x -= zoomRate
		zoom.y -= zoomRate


	if Input.is_action_pressed("cameraspeedup"):
		speed += 1
	if Input.is_action_pressed("cameraslowdown"):
		speed -= 1

	if Input.is_action_just_pressed("camerareset"):
		zoom = Vector2(1,1)
		offset = Vector2(0,0)
