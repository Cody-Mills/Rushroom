extends Node2D


#Camera 
var tween = create_tween()

func _ready() -> void:
	#Animation not working ?? 
	var player = get_tree().get_first_node_in_group("Player")
	var player_animation = player.get_node("PlayerAnimationPlayer")
	player_animation.play("IntroCutscene")
	#Camera Stuff
	tween.tween_property($Camera2D, "zoom", Vector2(2,2), 1)
	tween.tween_property($Camera2D, "zoom", Vector2(1,1), 1.5)
	#Title and UI Fade in
	tween.tween_property($UI/Title, "modulate", Color(1,1,1,1) ,1)
