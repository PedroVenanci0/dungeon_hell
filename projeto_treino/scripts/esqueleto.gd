extends Node2D

enum Sta_tteMachine {IDLE, WALK, ATTACK, DEATH}

const SPEED = 80
const DIST_FOLLOW = 300
const DIST_ATTACK = 100

var distance = 0.0
var strong = 10
var health = 3
var animation = ""
var state = Sta_tteMachine.IDLE
var direction = 0

@onready var animated_sprite_2d = $AnimatedSprite2D
#@onready var player = 
