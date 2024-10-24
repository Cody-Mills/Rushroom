extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent
@export var DAMAGE : float


func _damage(attack: Attack):
	if health_component:
		health_component._damage(attack)
		#damage animations aka glowing effects, extra

#need to add death
