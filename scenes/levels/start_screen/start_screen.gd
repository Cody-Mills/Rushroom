extends Node2D
@onready var player: Player = %Player

#Camera 
var camera_tween = create_tween()


func _ready() -> void:
	#player.animation_player.play("IntroCutscene") idk why no work
	camera_tween.tween_property($Camera2D, "zoom", Vector2(2,2), 1)
	camera_tween.tween_property($Camera2D, "zoom", Vector2(1,1), 1.5)
	pass
