extends Camera2D

@onready var Player = get_tree().get_first_node_in_group("Player")
@onready var camera: Camera2D = $"."
#@onready var phantom_camera_2d: PhantomCamera2D = $PhantomCamera2D


func _ready() -> void:
	#This locks the camera onto the player at the start
	global_position = Player.global_position
	align()
	#Phantom Camera Stuff
	#phantom_camera_2d.set_follow_target(Player)
	#phantom_camera_2d.set_follow_offset(Vector2(0, 2))
	#phantom_camera_2d.set_follow_damping(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (global_position != Player.global_position):
		DragCam()

func DragCam():
	pass
