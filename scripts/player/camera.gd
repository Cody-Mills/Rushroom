extends Camera2D

@onready var Player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	#This locks the camera onto the player at the start
	global_position = Player.global_position
	align()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (global_position != Player.global_position):
		print("test")
