class_name Player
extends CharacterBody2D

#Movement
@onready var animation_player: AnimationPlayer = %PlayerAnimationPlayer
@export var maxSpeed : float = 200
@export var speed : float = 30 
@export var acceleration := 500
var direction : String = "Down"
#Hiding
var is_hiding : bool = false

#States
enum {INTRO, MOVE, HIDE}
var state = MOVE

func _physics_process(delta):
	print(speed)
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
	#Stopped
	if velocity.length() == 0:
		StopMovement()
		animation_player.play("Idle" + direction)
		speed = 30
	#Moving
	else:
		if velocity.x < 0: 
			direction = "Left"
		if velocity.x > 0: 
			direction = "Right"
		if velocity.y > 0: 
			direction = "Down"
		if velocity.y < 0: 
			direction = "Up"
			#do either sin or lerp for speed to maxspeed
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
