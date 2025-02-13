extends CharacterBody2D

@export var velocity_x: float = -100;
@export var health: int = 100;
@export var impact_damage: int = 20;
@onready var progress_bar: ProgressBar = %ProgressBar

signal died()

func _ready() -> void:
	velocity.x = velocity_x 
	progress_bar.max_value = health;
	progress_bar.value = health;

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	var collision_count: int = get_slide_collision_count()

	for i in collision_count:
		var collition_info: KinematicCollision2D = get_slide_collision(i)
		var collider: Object = collition_info.get_collider()
		
		if collider.has_method("take_damage"):
			collider.take_damage(impact_damage)
			died.emit()
			queue_free()

func take_damage(damage: int) -> void:
	health -= damage
	progress_bar.value = health
	if health <= 0:
		died.emit()
		queue_free()
		
func on_game_over():
	queue_free()
