extends Node2D

onready var hud = $UI_layer/HUD
onready var enemy_spawner = $EnemySpawner
onready var ui_layer = $UI_layer

var score = 0

var GameOver = preload("res://UI/GameOverMenu.tscn")

func _ready() -> void:
	update_score_and_hud(0)
	hud.update_lives($Player.hp)

func spawn_laser(Laser, location) -> void:
	var laser = Laser.instance()
	add_child(laser)
	laser.global_position = location


func spawn_enemy(EnemyScene, location) -> void:
	var enemy = EnemyScene.instance()
	add_child(enemy)
	enemy.global_position = location
	if enemy.has_signal("spawn_laser"):
		enemy.connect("spawn_laser", self, "spawn_laser")
	enemy.connect("enemy_died", self, "_on_enemy_died")

func _on_DeadZone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_enemy_died(_score):
	update_score_and_hud(score + _score)

func update_score_and_hud(val):
	score = val;
	hud.update_score(score)


func _on_Player_player_took_damage(hp_left) -> void:
	hud.update_lives(hp_left)


func _on_Player_player_died() -> void:
	#player runs out of lives = game over logic
	var timer = get_tree().create_timer(2)
	yield(timer, "timeout")
	game_over()

func game_over():
	enemy_spawner.stop()
	var game_over_menu = GameOver.instance()
	ui_layer.add_child(game_over_menu)
	game_over_menu.set_score(score)
