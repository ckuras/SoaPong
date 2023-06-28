extends Area2D

@export var speed = 400
@export var player = 1

var screen_size # Size of the game window.
var input_map

#func initialize(player):
#	if player == 1:
#		input_map = {
#			"down": "move_down_p1",
#			"up": "move_up_p1"
#		}
#	else:
#		input_map = {
#			"down": "move_down_p2",
#			"up": "move_up_p2"
#		}

func _ready():
	screen_size = get_viewport_rect().size
	if player == 1:
		input_map = {
			"down": "move_down_p1",
			"up": "move_up_p1"
		}
	else:
		input_map = {
			"down": "move_down_p2",
			"up": "move_up_p2"
		}

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed(input_map["down"]):
		velocity.y += 1
		print('we goin down')
	if Input.is_action_pressed(input_map["up"]):
		velocity.y -= 1
		print('we goin up')
	
	position += velocity * delta * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	
#	print('eyy lmao')
