extends "res://projectiles/Laser.gd"

func _on_PlayerLaser_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.take_damage(damage)
		queue_free()
