extends Node2D

@onready var ui = $ui

var score = {
	'player1': 0,
	'player2': 0
}

# The area is the ball
func _on_player_1_goal_area_entered(area: Ball):
	# Increment the score
	set_score(Ball.PLAYER.TWO)
	
	# Reset the ball to the center of the screen
	area.reset(Ball.PLAYER.ONE)

# The area is the ball
func _on_player_2_goal_area_entered(area: Ball):
	set_score(Ball.PLAYER.ONE)
	
	# Reset the ball to the center of the screen
	area.reset(Ball.PLAYER.TWO)

func set_score(player):
	score["player%s" % (player + 1)] += 1
	ui.set_score(score)
	print(score)
