extends Area2D

@export var DAMAGE : int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.has_node("Hurtbox") && has_method("_damage"):
		print(body)
