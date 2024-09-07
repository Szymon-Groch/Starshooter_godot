extends Node2D


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
