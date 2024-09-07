extends Control

onready var score_label = $ScoreLabel
onready var lives_texture = $LivesTexture

func update_score(value):
	score_label.text = "SCORE: " + str(value)

func update_lives(val):
	lives_texture.rect_size.x = val * 37
	
