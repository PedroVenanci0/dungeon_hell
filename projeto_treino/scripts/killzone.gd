extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("Entrando em contato com o corpo: %s" % [body]);
	var _player = body as Player;
	_player.die()
	timer.start(0)
	

func _on_timer_timeout():
	get_tree().reload_current_scene()
