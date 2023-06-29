extends GutTest

var utils = preload("res://utils.gd")

var area = Area2D.new()

func before_each():
	area = Area2D.new()

func test_is_a_wall_returns_true_with_area_in_wall_group():
	area.add_to_group("wall")

	assert_true(utils.is_a_wall(area))

func test_is_a_wall_returns_false_with_area_in_paddle_group():
	area.add_to_group("paddle")

	assert_false(utils.is_a_wall(area))

func test_flip_y_turns_positive_y_negative():
	var vector_with_positive_y = Vector2(17, 38)
	
	var resultant_vector = utils.flip_y(vector_with_positive_y)
	
	assert_eq(resultant_vector, Vector2(17, -38))
	
func test_flip_y_turns_negative_y_positive():
	var vector_with_positive_y = Vector2(17, -38)
	
	var resultant_vector = utils.flip_y(vector_with_positive_y)
	
	assert_eq(resultant_vector, Vector2(17, 38))

func test_flip_y_does_not_change_vector_with_y_of_zero():
	var vector_with_positive_y = Vector2(42, 0)
	
	var resultant_vector = utils.flip_y(vector_with_positive_y)
	
	assert_eq(resultant_vector, Vector2(42, 0))
