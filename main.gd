extends Node2D

@onready var start_button = $CanvasLayer/CenterContainer/Start
@onready var game_over = $CanvasLayer/CenterContainer/GameOver

var enemy := preload("res://enemy/enemy.tscn")
var score := 0

func _ready() -> void:
	game_over.hide()
	start_button.show()
	#start()
	
	
func start() -> void:
	$Player.shield = 10
	for x in range(9):
		for y in range(3):
			var e = enemy.instantiate()
			var pos = Vector2(x * (16 + 8) + 24, 16 * 4 + y * 16)
			add_child(e)
			e.start(pos)
			e.died.connect(_on_enemy_died)

func _on_enemy_died(value):
	score += value
	$CanvasLayer/UI.update_score(score)


func _on_start_pressed() -> void:
	start_button.hide()
	new_game()
	
func new_game():
	score = 0
	$CanvasLayer/UI.update_score(score)
	$Player.start()
	#spawn_enemies()
	start()


func _on_player_died() -> void:
	get_tree().call_group("enemies", "queue_free")
	game_over.show()
	await get_tree().create_timer(2).timeout
	game_over.hide()
	start_button.show()
