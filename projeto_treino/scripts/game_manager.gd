extends Node

@onready var score_label = $score_label
@export var cloudsLayer: ParallaxLayer
@export var cloudsBgLayer: ParallaxLayer
@export var cloudsVelocity: float

var score = 0


func _process(delta):
	cloudsLayer.motion_offset += Vector2(-cloudsVelocity, 0)
	cloudsBgLayer.motion_offset += Vector2(cloudsVelocity, 0)

func add_point():
	score += 1
	score_label.text = "coins = " + str(score)
	
