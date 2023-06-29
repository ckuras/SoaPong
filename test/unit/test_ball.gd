extends GutTest

var ball = preload("res://ball.gd")

var area = Area2D.new()
var _ball = ball.new()

func before_each():
	area = Area2D.new()
	_ball = ball.new()
	
	area.set_position(Vector2(0, 0))

func test_wall_hit_turns_positive_y_velocity_negative():
	area.add_to_group("wall")
	var current_velocity = Vector2(1, 1)
	
	var new_velocity = _ball.velocity_from_area_collision(area, current_velocity)
	
	assert_eq(Vector2(1, -1), new_velocity)
	
func test_wall_hit_turns_negative_y_velocity_positive():
	area.add_to_group("wall")
	var current_velocity = Vector2(1, -1)
	
	var new_velocity = _ball.velocity_from_area_collision(area, current_velocity)
	
	assert_eq(Vector2(1, 1), new_velocity)

func test_paddle_hit_directly_center():
	_ball.set_position(Vector2(1, 0))
	var current_velocity = Vector2(1, 0)
	
	var new_velocity = _ball.velocity_from_area_collision(area, current_velocity)
	assert_eq(Vector2(1, 0), new_velocity)

func test_paddle_hit_from_bottom():
	_ball.set_position(Vector2(1, 1))
	var current_velocity = Vector2(1, 0)
	
	var new_velocity = _ball.velocity_from_area_collision(area, current_velocity)
	assert_almost_eq(Vector2(0.707, 0.707), new_velocity, Vector2(.01, .01))
