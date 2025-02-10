extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

 
func _physics_process(delta: float) -> void:
	global_position.x += -200 * delta;
	global_position.y += 0;
