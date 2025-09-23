extends Node2D

var personDummy = preload("res://personDummy.tscn").instantiate()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("b"):
		add_child(personDummy)
		personDummy.position = Vector2(576,50)
