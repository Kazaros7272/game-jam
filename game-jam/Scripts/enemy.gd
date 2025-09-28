extends CharacterBody2D

var SPEED = 80
@onready var player: CharacterBody2D = $"../../Player"

@onready var damage_area: Area2D = $Area2D
var damage = 1

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	SPEED *= randf_range(0.5,1.2)
func _physics_process(delta: float) -> void:
	var dir : Vector2
	if player != null:
		dir = (player.position - position).normalized()
		
	
	velocity = dir * SPEED
	
	move_and_slide()
		
	if velocity.x < 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
		

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body == player:
		player.get_script().take_damage(damage)
