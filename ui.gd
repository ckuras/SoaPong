extends Control

@onready var player1_score_label = $MarginContainer/HBoxContainer/Player1Score
@onready var player2_score_label = $MarginContainer/HBoxContainer/Player2Score

func set_score(score):
	player1_score_label.text = str(score['player1'])
	player2_score_label.text = str(score['player2'])

