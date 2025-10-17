extends CharacterBody2D

@export var gravity = 1000
@export var climb = 500
@export var max_speed = 500

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		velocity.y -= climb
		velocity.y = clampf(velocity.y, -max_speed, max_speed)
		
