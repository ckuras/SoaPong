extends Area2D

@export var speed = 100

func _ready():
	pass


func _process(delta):
	var velocity = Vector2.ZERO
	
	velocity.x -= 1

	position += velocity * delta * speed
