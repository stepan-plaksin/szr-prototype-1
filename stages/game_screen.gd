extends Node2D

@onready var ship_killed_label: Label = %ShipKilledLabel
@onready var label: Label = %Label
@onready var game_over_label: Label = %GameOverLabel
@export var tries_count: int = 2;


var ships_killed = 0;

func _ready() -> void:
	label.text = str(tries_count)
	ship_killed_label.text = str(ships_killed)

	
func _on_fish_detector_body_entered(body: Node2D) -> void:
	tries_count -= 1
	label.text = str(tries_count)
	
	if tries_count <= 0:
		game_over_label.visible = true
		
		#var to_destroy = get_tree().get_nodes_in_group("destroy_on_game_over")
		#for item in to_destroy:
			#item.queue_free()
		propagate_call("on_game_over")
	

func _on_spawn_point_ship_died() -> void:
	ships_killed += 1
	ship_killed_label.text = str(ships_killed)
