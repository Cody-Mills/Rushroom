extends CharacterBody2D

const Acceleration = 500
var Max_Speed = 200
const Friction = 500

@onready var animation = $AnimationPlayer

func _physics_process(delta):
	DirectionalInput(delta)
	move_and_slide()
	DirectionalAnimation()

func DirectionalInput(delta):
	var Input_Vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity = velocity.move_toward(Input_Vector * Max_Speed, Acceleration * delta)

func DirectionalAnimation():
	if velocity.length() == 0:
		animation.stop()
	else:
		var Direction
		if velocity.x < 0: 
			$Sprite2D.flip_h = true
			Direction = "Left"
		elif velocity.x > 0:
			$Sprite2D.flip_h = false
			Direction = "Right"
		elif velocity.y < 0:
			$Sprite2D.flip_v = false
			Direction = "Up"
		elif velocity.y > 0:
			$Sprite2D.flip_v = true
			Direction = "Down"
		animation.play("Move" + Direction)
