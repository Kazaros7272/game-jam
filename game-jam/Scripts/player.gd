extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


var SPEED = 120.0
static var max_health = 3
static var cur_health = max_health
var attacking = false
func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * SPEED
	if velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
		
	move_and_slide()

	
	if cur_health <= 0:
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("sacrifice") && cur_health > 1:
		print("Lose 1 health, Gain 10% speed")
		cur_health -= 1
		SPEED *= 1.20
		
static func take_damage(damage: int):
	print("take damage")
	cur_health -= damage
	

	
