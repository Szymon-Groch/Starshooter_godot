extends Node2D



func _on_Player_spawn_laser(Laser, location) -> void:
	var laser = Laser.instance()
	add_child(laser)
	laser.global_position = location


func _on_Enemy_spawn_laser(Laser, location) -> void:
	var laser = Laser.instance()
	add_child(laser)
	laser.global_position = location
