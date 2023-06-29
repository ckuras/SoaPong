extends Area2D

@export var speed = 100
var velocity = Vector2(-1, 0)

func _ready():
	pass

func _process(delta):
	position = position_in_next_frame(position, velocity, delta, speed)

func _on_area_entered(area):
	velocity = velocity_from_area_collision(area, velocity)

func position_in_next_frame(current_position, velocity, delta, speed):
	var position_delta = velocity * delta * speed

	return current_position + position_delta

func velocity_from_area_collision(area, current_velocity):
	if (is_a_wall(area)):
		return flip_y(current_velocity)
	else:
		var vector_between_ball_and_wall_origins = position - area.position
		return vector_between_ball_and_wall_origins.normalized()

func is_a_wall(area: Area2D):
	return area.get_groups().has("wall")

func flip_y(vector: Vector2):
	return Vector2(vector.x, vector.y * -1)
