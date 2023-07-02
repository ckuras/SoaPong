extends Node2D

signal scored(score)

@onready var ui = $ui
@onready var ball = $Ball

var score = {
	'player1': 0,
	'player2': 0
}

func _ready():
	randomize()
	if randf() < 0.5:
		ball.reset(Ball.PLAYER.ONE)
	else:
		ball.reset(Ball.PLAYER.TWO)
	self.scored.connect(ui.set_score)

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
	emit_signal("scored", score)
