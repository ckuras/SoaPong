extends Node2D

enum PLAYER {
	ONE,
	TWO
}

var score = {
	'player1': 0,
	'player2': 0
}

func _on_player_1_goal_area_entered(area):
	set_score(PLAYER.ONE)

func _on_player_2_goal_area_entered(area):
	set_score(PLAYER.TWO)

func set_score(player):
	score["player%s" % (player + 1)] += 1
	print(score)
