class_name Player
extends CharacterBody2D

#Movement
const Acceleration = 500
var Walk_Speed = 200
const Friction = 500
#Animation
var last_facing_direction := Vector2(0, -1)
@onready var animation_tree = $AnimationTree


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
	SetAnimations()
	if Input_Vector != Vector2.ZERO:
		velocity = velocity.move_toward(Input_Vector * Walk_Speed, Acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, Friction * delta)
	move_and_slide()
	if Input.is_action_just_pressed("ui_attack"):
		State = ATTACK

func AttackState():
	print("Attack")

func SetAnimations():
	animation_tree.set("parameters/Walk/blend_position", velocity)
	animation_tree.set("parameters/Idle/blend_position", velocity)
