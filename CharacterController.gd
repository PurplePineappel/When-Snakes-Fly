extends RigidBody2D

@onready var tailArea = $"../Tail/TailDetector"

signal flap

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("flap"):
		apply_central_impulse(Vector2(0,-2000))
		emit_signal("flap")
	if Input.is_action_pressed("left"):
		apply_central_impulse(Vector2(-50,-5))
	if Input.is_action_pressed("right"):
		apply_central_impulse(Vector2(50,-5))

	if Input.is_action_just_pressed("grab"):
		var areas = tailArea.get_overlapping_areas()
		if areas.is_empty() == false:
			if (areas[0].get_parent()).is_in_group("canGrab"):
				((areas[0].get_parent()).get_parent()).queue_free()
