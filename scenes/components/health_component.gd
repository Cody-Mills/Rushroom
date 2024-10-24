extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 3
var health : float

func _ready() -> void:
	health = MAX_HEALTH

func _damage(attack: Attack):
	#attack is declared in the attack.gd
	health -= attack.attack_damage
	print(health)
	
	if health <= 0:
		get_parent().queue_free()
