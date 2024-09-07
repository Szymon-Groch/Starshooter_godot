extends "res://projectiles/Laser.gd"

func _on_Laser_area_entered(area: Area2D) -> void: #enemy laser
	if area is Player:
		area.take_damage(damage)
