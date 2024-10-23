extends Area2D

@export var MAX_HEALTH : int = 3
var health

func _ready() -> void:
	health = MAX_HEALTH

func _heal(heal : int):
	if health != MAX_HEALTH:
		health =+ 1

func _damage(damage : int):
	health =- damage
	if health <= 0:
		_death()

func _death():
	print ("death")
