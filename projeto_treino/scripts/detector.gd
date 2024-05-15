extends Area2D
@onready var player = $player
@onready var camera_2d = $"../player/Camera2D"


func _on_body_entered(body):
	print("ai")
	var _player = body as Player;
	_player.cam()
	
