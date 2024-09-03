extends CharacterBody2D

const Acceleration = 500
var Max_Speed = 200
const Friction = 500

enum{
	MOVE,
	ATTACK,
}

var State = MOVE
@onready var Animation_Player = $AnimationPlayer
@onready var Animation_Tree = $AnimationTree
@onready var Animation_State = Animation_Tree.get("parameters/playback")


func _physics_process(delta):
	match State:
		MOVE:
			MoveState(delta)
		ATTACK:
			AttackState()

func MoveState(delta):
	var Input_Vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
	if Input_Vector != Vector2.ZERO:
		Animation_Tree.set("parameters/Idle/blend_position", Input_Vector)
		Animation_Tree.set("parameters/Walk/blend_position", Input_Vector)
		Animation_Tree.set("parameters/Attack/blend_position", Input_Vector)
		Animation_State.travel("Walk")
		velocity = velocity.move_toward(Input_Vector * Max_Speed, Acceleration * delta)
	else:
		Animation_State.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, Friction * delta)
	move_and_slide()
	if Input.is_action_just_pressed("ui_attack"):
		State = ATTACK
	
func AttackState():
	velocity = Vector2.ZERO
	Animation_State.travel("Attack")


func _on_attack_finished(Attack):
	State = MOVE
