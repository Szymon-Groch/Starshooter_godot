extends Control



func _on_StarButton_pressed() -> void:
	get_tree().change_scene("res://World.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
