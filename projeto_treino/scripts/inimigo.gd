extends Node2D

var speed = 60

var direção = 1

@onready var ray_cast_right = $RayCast_Right
@onready var ray_cast_left = $RayCast_left
@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	if ray_cast_right.is_colliding():
		direção = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direção = 1
		animated_sprite.flip_h = false
	
	position.x += direção * speed * delta
