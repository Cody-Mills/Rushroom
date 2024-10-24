extends Area2D
class_name HurtboxComponent

@export var attack_damage : float
@export var knockback_force : float 

func _on_body_entered(body: Node2D) -> void:
	if body is HitboxComponent:
		var hitbox : HitboxComponent = body
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.knockback_force = knockback_force
		attack.attack_position = global_position
		
		hitbox._damage(attack)
