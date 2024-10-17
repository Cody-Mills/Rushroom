extends Node2D

var tween = create_tween()
var is_in_options : bool = false

func _ready() -> void:
	#Animation not working ?? 
	var player = get_tree().get_first_node_in_group("Player")
	var player_animation = player.get_node("PlayerAnimationPlayer")
	player_animation.play("IntroCutscene")
	print(player_animation.get_current_animation)
	#Camera Stuff
	tween.tween_property($Camera2D, "zoom", Vector2(2,2), 1)
	tween.tween_property($Camera2D, "zoom", Vector2(1,1), 1.5)
	#Title and UI Fade in
	tween.tween_property($UI/Title, "modulate", Color(1,1,1,1) ,1)
	tween.tween_property($Buttons/PlayImage, "modulate", Color(1,1,1,1) ,1)
	tween.tween_property($Buttons/OptionsImage, "modulate", Color(1,1,1,1) ,0.5)
	tween.tween_property($Buttons/ExitImage, "modulate", Color(1,1,1,1) ,0.5)


func _on_play_body_entered(body: Node2D) -> void:
	print("play")



func _on_options_body_entered(body: Node2D) -> void:
	print("options")


func _on_exit_body_entered(body: Node2D) -> void:
	var screen_fade_tween = create_tween()
	body.speed = 0
	$CanvasLayer/TextureRect.visible = true
	screen_fade_tween.tween_property($CanvasLayer/TextureRect, "modulate", Color(0,0,0,1), 1)
	get_tree().quit
