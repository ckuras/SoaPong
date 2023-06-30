extends Area2D

var utils = preload("res://utils.gd")

@export var speed = 100
var velocity = Vector2(-1, 0)

func _ready():
	pass

func _physics_process(delta):
	position = position_in_next_frame(position, velocity, delta, speed)

func _on_area_entered(area):
	velocity = velocity_from_area_collision(area, velocity)

func position_in_next_frame(current_position, velocity, delta, speed):
	var position_delta = velocity * delta * speed

	return current_position + position_delta

func velocity_from_area_collision(area, current_velocity):
	if (utils.is_a_wall(area)):
		return utils.flip_y(current_velocity)
	else:
		var vector_between_ball_and_wall_origins = position - area.position
		return vector_between_ball_and_wall_origins.normalized()
