extends Node2D

@onready var timer: Timer = $Timer


const ENEMY = preload("uid://bdkjbbqu2n8m")

func _on_timer_timeout() -> void:
	timer.start()
	var enemy = ENEMY.instantiate()
	add_child(enemy)
	print("SPAWN")
