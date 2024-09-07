extends Control

onready var score_label = $ScoreLabel
onready var lives_texture = $LivesTexture
onready var tutorial_timer = $TutorialTimer
onready var tutorial = $Tutorial


func update_score(value):
	score_label.text = "SCORE: " + str(value)

func update_lives(val):
	lives_texture.rect_size.x = val * 37
	


func _on_TutorialTimer_timeout() -> void:
	tutorial.queue_free()
