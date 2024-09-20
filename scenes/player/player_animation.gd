extends Node2D

@export var animation_tree : AnimationTree
@onready var player : Player = get_owner() #Gets Class Name

var last_facing_direction := Vector2(0, -1)

func _physics_process(delta: float) -> void:
