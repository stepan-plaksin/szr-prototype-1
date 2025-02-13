extends Marker2D


@onready var enemy_ship_scene = preload("res://entities/ships/enemy_ship/enemy_ship.tscn");
@export var min_spawn_time: float = 2;
@export var max_spawn_time: float = 3;
@export var items: Array[PackedScene] = []


signal ship_died()

func _ready() -> void:
	spawn_enemy_ship()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn_enemy_ship() -> void:

	var enemy_ship = items.pick_random().instantiate()
	enemy_ship.died.connect(on_ship_died)
	add_child(enemy_ship)
	
	var timer: SceneTreeTimer = get_tree().create_timer(randf_range(min_spawn_time, max_spawn_time)) ;
	timer.timeout.connect(spawn_enemy_ship)

func on_ship_died() -> void:
	ship_died.emit()

func on_game_over():
	queue_free()
