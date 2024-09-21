class_name Player
extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@export var speed := 200
@export var acceleration := 500
var is_moving : bool = false
var direction : String = "Down"

enum {MOVE, ATTACK}

var state = MOVE

func _physics_process(delta):
	match state:
		MOVE:
			MoveState(delta)
		#ATTACK:
			#AttackState()

func MoveState(delta):
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity = velocity.move_toward(input_vector * speed, acceleration * delta)
	if velocity.length() == 0:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
		animation_player.play("Idle" + direction)
	else:
		if velocity.x < 0: direction = "Left"
		if velocity.x > 0: direction = "Right"
		if velocity.y > 0: direction = "Down"
		if velocity.y < 0: direction = "Up"
		animation_player.play("Move" + direction)
	move_and_slide()
