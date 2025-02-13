extends Sprite2D


@export var damage: int = 40;
@export var health: int = 100;


func _physics_process(delta: float) -> void:
		global_position.x += 400 * delta;


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") and body.has_method("take_damage"):
		body.take_damage(damage)
		queue_free()

	
