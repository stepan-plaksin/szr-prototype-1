extends Sprite2D


func _physics_process(delta: float) -> void:
	const MISSILE = preload("res://scenes/missile.tscn");
	var missile = MISSILE.instantiate()
	add_child(missile)
