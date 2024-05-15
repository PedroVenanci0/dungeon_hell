extends CharacterBody2D
class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var health = 100

## Estado do player atacando
var is_ataque = false;

## Estado morto do jogador
var died = false;


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var attack_sound = preload("res://assets/sounds/coin.wav")
@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var audio_stream_player : AudioStreamPlayer = $AudioStreamPlayer
@onready var camera_2d = $Camera2D

func _physics_process(delta):
			
	if is_ataque:
		attack()
	else:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction = Input.get_axis("left", "right")

		if Input.is_action_just_pressed("ataque_basico"):
			attack()
		
		# animações 
		if died:
			animated_sprite.play("death")
		else:
			if is_on_floor():
				if direction == 0 or velocity.x == 0:
					animated_sprite.play("idle")
				else:
					animated_sprite.play("run")
			else:
				if velocity.y <= 0:
					animated_sprite.play("jump")
				elif velocity.y > 0:
					animated_sprite.play("fall")
		
		# movimentos
		
		if direction > 0:
			animated_sprite.flip_h = false
		if direction < 0:
			animated_sprite.flip_h = true
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	

func attack():
	if is_on_floor():
		is_ataque = true
		#audio_stream_player.stream = attack_sound
		#audio_stream_player.play()
		animated_sprite.play("ataque(basico)")
		await animated_sprite.animation_finished
		#audio_stream_player.stop()
		
		is_ataque = false

func die():
	died = true
	animated_sprite.play("death")
	await animated_sprite.animation_finished
	
func cam():
	camera_2d.set_deferred("limit_bottom",0)
	






	
