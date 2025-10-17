extends Area2D

@export var speed : float = 200

signal crash
signal add_score

func _physics_process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < -50:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	print("CRASH")
	crash.emit()
		
func _on_area_score_body_entered(body: Node2D) -> void:
	print(">>> SCORE")
	add_score.emit()
