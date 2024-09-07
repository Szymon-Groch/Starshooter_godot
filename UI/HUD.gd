extends Control

onready var score_label = $ScoreLabel

func update_score(value):
	score_label.text = "SCORE: " + str(value)
