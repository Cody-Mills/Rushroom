extends Node2D

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
	tween.tween_property($UI/Play, "modulate", Color(1,1,1,1) ,1)
	tween.tween_property($UI/Options, "modulate", Color(1,1,1,1) ,0.5)
	tween.tween_property($UI/Exit, "modulate", Color(1,1,1,1) ,0.5)


func _on_play_area_entered(area: Area2D) -> void:
	pass


func _on_options_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_exit_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
