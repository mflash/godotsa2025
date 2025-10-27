extends CharacterBody2D

@export var gravity = 1000
@export var climb = 500
@export var max_speed = 500

@onready var started = false
	
func _physics_process(delta: float) -> void:
	if started:
		velocity.y += gravity * delta
		move_and_slide()

func start() -> void:
	started = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		velocity.y -= climb
		velocity.y = clampf(velocity.y, -max_speed, max_speed)
		
