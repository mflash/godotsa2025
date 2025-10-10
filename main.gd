extends Node2D

var score := 0

func _on_rock_body_entered(body: Node2D) -> void:
	$Player.queue_free()


func _on_rock_score_body_entered(body: Node2D) -> void:
	score += 1
	$CanvasLayer/Label.text = "Score: "+str(score)
