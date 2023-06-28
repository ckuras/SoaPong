extends Area2D

@export var speed = 100
var direction = 1

func _ready():
	pass

func _process(delta):
	var velocity = Vector2.ZERO
	velocity.x -= direction
	position += velocity * delta * speed

func _on_area_entered(area):
	print('bounce')
	direction *= -1
