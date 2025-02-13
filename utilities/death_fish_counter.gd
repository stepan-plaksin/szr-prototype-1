extends Node

signal death_counted

func count_death() -> void:
	death_counted.emit()
