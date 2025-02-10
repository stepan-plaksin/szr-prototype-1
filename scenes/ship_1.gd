extends Sprite2D

@onready var missile: Sprite2D = %Missile

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	missile.global_position.x += 400 * delta;
