extends Area2D

@export var speed = 100
var velocity: Vector2 = Vector2(-1,0)

func _ready():
	pass

func _process(delta):
	position += velocity * delta * speed

func _on_area_entered(area):
	if (area.get_groups().has("wall")):
		velocity.y *= -1
	else:
		var new_velocity: Vector2 = position - area.position
		var new_velocity_normalized = new_velocity.normalized()
		print(new_velocity_normalized)
		velocity = new_velocity_normalized
	
