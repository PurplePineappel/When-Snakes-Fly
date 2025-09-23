extends AnimatedSprite2D

func _on_animation_finished():
	play("default")

func _on_head_flap() -> void:
	play("default")
	play("flap") 
