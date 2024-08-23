extends Node2D

@onready var hitbox_timer = $Hitbox/HitboxTimer

var SPEED = 80 #Higher is slower because its the speed between
var is_Chasing = false
var is_Attacking = false
var Player = null

func _physics_process(delta):
	if is_Chasing:
		position += (Player.position - position) / SPEED

func _on_hit_box_body_entered(body):
	pass

func _on_hit_box_body_exited(body):
	pass

func _on_detection_box_body_entered(body):
	Player = body
	is_Chasing = true
	$DetectionBox/CollisionShape2D.scale = Vector2(1.4, 1.4)

func _on_detection_box_body_exited(body):
	Player = null
	is_Chasing = false
	$DetectionBox/CollisionShape2D.scale = Vector2(1, 1)
