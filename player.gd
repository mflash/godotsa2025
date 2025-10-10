extends CharacterBody2D

const gravidade = 2000

func _physics_process(delta: float) -> void:
	velocity.y += gravidade * delta
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("flap"):
		velocity.y -= 1000
		velocity.y = clampf(velocity.y, -1000, 1000)
		
