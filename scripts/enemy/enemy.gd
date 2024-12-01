extends Node
class_name Enemy

enum {
	SEARCHING,
	CHASING,
	ALERT,
	ATTACKING,
}
var state = SEARCHING
@onready var Player = get_tree().get_first_node_in_group("Player")

func _process(delta: float) -> void:
	match state:
		SEARCHING: 
			SearchingState()
		CHASING:
			ChasingState()
		ALERT:
			AlertState()
		ATTACKING:
			AttackingState()

func SearchingState():
	print("Searching")
	pass

func ChasingState():
	print("Chasing")
	pass

func AlertState():
	print("Alert")
	pass

func AttackingState():
	print("Attacking")
	pass
