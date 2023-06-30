static func is_a_wall(area: Area2D):
	return area.get_groups().has("wall")

static func flip_y(vector: Vector2):
	return Vector2(vector.x, vector.y * -1)
