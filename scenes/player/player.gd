class_name Player
extends CharacterBody2D

#Movement
@onready var animation_player: AnimationPlayer = %PlayerAnimationPlayer
@export var speed := 200
@export var acceleration := 500
var is_moving : bool = false
var direction : String = "Down"
#Hiding
var is_hiding : bool = false

#States
enum {INTRO, MOVE, HIDE}
var state = MOVE

func _ready() -> void:
	#need to make it so that if the root scene is called start_screen then state = INTRO
	pass

func _physics_process(delta):
	match state:
		INTRO:
			IntroState()
		MOVE:
			MoveState(delta)
		HIDE:
			HideState(delta)

func IntroState():
	pass

func MoveState(delta):
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity = velocity.move_toward(input_vector * speed, acceleration) #include delta for slower turns
	if velocity.length() == 0:
		StopMovement()
		animation_player.play("Idle" + direction)
	else:
		if velocity.x < 0: direction = "Left"
		if velocity.x > 0: direction = "Right"
		if velocity.y > 0: direction = "Down"
		if velocity.y < 0: direction = "Up"
		animation_player.play("Move" + direction)
	move_and_slide()
	if Input.is_action_pressed("ui_attack"):
		state = HIDE

func HideState(delta): 
	#!!! Need to use the animation.set next function
	#if Input.is_action_pressed("ui_attack") && !is_hiding:
		#StopMovement()
		#animation_player.play("Hide" + direction)
		#$Timers/HidingTimer.start()
		##timeout enables is_hiding
	#if !Input.is_action_pressed("ui_attack") && animation_player.current_animation_position < 0.2:
		#animation_player.stop
		#is_hiding = false
		#state = MOVE
	#if !Input.is_action_pressed("ui_attack") && is_hiding:
		pass



func StopMovement():
	velocity = velocity.move_toward(Vector2.ZERO, acceleration) #include delta for slower turns


func _on_hiding_timer_timeout():
	is_hiding = true


func _on_intro_finished(IntroCutscene: StringName) -> void:
	state = MOVE
