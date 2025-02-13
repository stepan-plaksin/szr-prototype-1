extends StaticBody2D

@onready var missile_scene = preload("res://entities/missile/missile.tscn");
@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = %ProgressBar

@export var health: int = 100;
@export var parent_node_path: NodePath

func _ready() -> void:
	progress_bar.max_value = health
	progress_bar.value = health
	
	timer.timeout.connect(on_timeout);
	timer.start()

func on_timeout() -> void:
	var missile: Node2D = missile_scene.instantiate()
	missile.position = position
	var parent_node = get_node(parent_node_path)
	parent_node.add_child(missile) 

func take_damage(damage: int):
	health -= damage
	progress_bar.value = health
	
	if health == 0:
		queue_free()

func on_game_over():
	queue_free()
