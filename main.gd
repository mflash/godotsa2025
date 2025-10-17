extends Node2D

@export var rocks: Array[PackedScene]

var screen_size: Rect2
var score := 0

func _ready() -> void:
	screen_size = get_viewport_rect()
	print("Total rocks:",rocks.size())
	$Background.z_index = -1
	$Foreground.z_index = 1
	$RockDownTimer.wait_time = randf_range(2, 5)
	$RockUpTimer.wait_time = randf_range(2, 5)

func _on_rock_down_timer_timeout() -> void:
	var rock_num := randi_range(0, rocks.size()-1)
	var rock := rocks[rock_num].instantiate()
	var sprite := rock.get_node("Sprite2D")
	rock.position.y = screen_size.size.y - rock.scale.y * sprite.get_rect().size.y/2
	rock.position.x = screen_size.size.x + 50
	add_child(rock)
	$RockDownTimer.wait_time = randf_range(2, 5)
	rock.connect("add_score", _on_add_to_score)
	

func _on_rock_up_timer_timeout() -> void:
	var rock_num := randi_range(0, rocks.size()-1)
	var rock := rocks[rock_num].instantiate()
	var sprite := rock.get_node("Sprite2D")
	rock.position.y = rock.scale.y * sprite.get_rect().size.y/2
	rock.position.x = screen_size.size.x + 50
	rock.rotation_degrees = 180
	add_child(rock)
	$RockUpTimer.wait_time = randf_range(2, 5)
	rock.connect("add_score", _on_add_to_score)

func _on_add_to_score() -> void:
	score += 1
	print("Score: ",str(score))
