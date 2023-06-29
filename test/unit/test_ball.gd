extends GutTest

var ball = preload("res://ball.gd")

var area = Area2D.new()
var _ball = ball.new()

func before_each():
	area = Area2D.new()
	_ball = ball.new()
	
	area.set_position(Vector2(0, 0))
	area.add_to_group("wall")

func test_wall_hit_turns_positive_y_velocity_negative():
	var current_velocity = Vector2(1, 1)
	
	var new_velocity = _ball.velocity_from_wall_collision(area, current_velocity)
	
	assert_eq(Vector2(1, -1), new_velocity)
	
func test_wall_hit_turns_negative_y_velocity_positive():
	var current_velocity = Vector2(1, -1)
	
	var new_velocity = _ball.velocity_from_wall_collision(area, current_velocity)
	
	assert_eq(Vector2(1, 1), new_velocity)
