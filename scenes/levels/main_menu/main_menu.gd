class_name MainMenu
extends Control

@onready var start_level = preload("res://scenes/levels/test_level/test_level.tscn") as PackedScene
#upgrade start level to be something like current level

func _on_continue_button_pressed():
	get_tree().change_scene_to_packed(start_level)



func _on_new_game_button_pressed():
	#show are you sure you want to delete your save?
	#if yes then delete save
	get_tree().change_scene_to_packed(start_level)



func _on_options_button_pressed():
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
