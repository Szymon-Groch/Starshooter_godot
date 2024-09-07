extends Node2D

onready var hud = $HUD

var score = 0

func _ready() -> void:
	update_score_and_hud(0)

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
