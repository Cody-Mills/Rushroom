class_name Player
extends CharacterBody2D

const Acceleration = 500
var Walk_Speed = 200
const Friction = 500

enum{
	MOVE,
	ATTACK,
}

var State = MOVE

func _physics_process(delta):
	match State:
		MOVE:
			MoveState(delta)
		ATTACK:
			AttackState()

func MoveState(delta):
	var Input_Vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if Input_Vector != Vector2.ZERO:
		velocity = velocity.move_toward(Input_Vector * Walk_Speed, Acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, Friction * delta)
	move_and_slide()
	if Input.is_action_just_pressed("ui_attack"):
		State = ATTACK
	
func AttackState():
	velocity = Vector2.ZERO

#Goes Back to Idle/Move
func _on_animation_finished():
	velocity = Vector2.ZERO
	State = MOVE
