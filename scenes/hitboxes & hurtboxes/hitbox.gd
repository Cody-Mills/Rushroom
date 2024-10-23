extends Area2D

@export var DAMAGE : int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("Damage")
