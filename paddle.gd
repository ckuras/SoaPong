extends Area2D

enum PLAYER {
	ONE,
	TWO
}

@export var speed = 400
@export var player = PLAYER.ONE

var screen_size

var up = "move_up_p1"
var down = "move_down_p1"

func _ready():
	screen_size = get_viewport_rect().size
	match (player):
		PLAYER.ONE:
			down = "move_down_p1"
			up = "move_up_p1"
		PLAYER.TWO:
			down = "move_down_p2"
			up = "move_up_p2"

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed(down):
		velocity.y += 1
	if Input.is_action_pressed(up):
		velocity.y -= 1
	
	position += velocity * delta * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
