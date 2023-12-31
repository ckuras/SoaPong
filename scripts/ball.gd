class_name Ball extends Area2D

enum PLAYER {
	ONE,
	TWO
}

var utils = preload("res://scripts/utils.gd")

@export var speed = 200
var velocity = Vector2(-1, 0)
const STARTING_POS = Vector2(240, 240)


func _physics_process(delta):
	position = position_in_next_frame(position, velocity, delta, speed)

func _on_area_entered(area):
	velocity = velocity_from_area_collision(area, velocity)

func reset(player: PLAYER):
	velocity = Vector2.ZERO
	position = STARTING_POS
	await get_tree().create_timer(1.0).timeout
	
	# Point the velocity at the player upon whom got scored.
	var new_x_component = -1
	if (player == PLAYER.TWO):
		new_x_component = 1
	velocity = Vector2(new_x_component, 0)

func position_in_next_frame(current_position, velocity, delta, speed):
	var position_delta = velocity * delta * speed

	return current_position + position_delta

func velocity_from_area_collision(area, current_velocity):
	if (utils.is_a_wall(area)):
		return utils.flip_y(current_velocity)
	else:
		var vector_between_ball_and_wall_origins = position - area.position
		return vector_between_ball_and_wall_origins.normalized()
