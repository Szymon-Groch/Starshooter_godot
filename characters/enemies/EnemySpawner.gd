extends Node2D

signal spawn_enemy(EnemyScene, location)

export (Array, PackedScene) var enemies 

var spawn_positions = null

func _ready() -> void:
	randomize() #to prevent same random numbers
	spawn_positions = $SpawnPositions.get_children() #array of 2D postions nodes

func _on_SpawnTimer_timeout() -> void:
	spawn_random_enemy()

func spawn_random_enemy():
	var rand_enemmy = enemies[randi()%enemies.size()]
	var rand_index = randi() % spawn_positions.size()
	emit_signal("spawn_enemy",rand_enemmy, spawn_positions[rand_index].global_position)
