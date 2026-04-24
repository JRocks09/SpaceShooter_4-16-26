extends CharacterBody2D

signal spawn_laser(location)

@onready var player_sprite = $Sprite2D
@onready var muzzle = $Muzzle
@onready var laser_cooldown_timer:Timer = $"../LaserCooldownTimer"

var speed = 400
var input_vector = Vector2.ZERO
var player_hp = 3
var cooldown = false


func _physics_process(_delta: float):
	var direction = Input.get_vector("Move_Left","Move_Right",
	"Move_Up","Move_Down")
	velocity = speed * direction
	move_and_slide()
	
	if Input.is_action_just_pressed("Shoot") && !cooldown:
		shoot_laser()

func _on_area_entered(area: Area2D):
	if area.is_in_group("enemies"):
		area.queue_free()
		player_take_damage(1, area)
	elif area.is_in_group("powerups"):
		player_heal(1)
		area.collect()
	$"../PlayerHP".text = "HP: " + str(player_hp)
	print_debug("Player HP: " + str(player_hp))

func player_take_damage(damage, area):
	player_hp = player_hp - damage
	if player_hp <= 0:
		area.reset_enemy_speed()
		get_tree().change_scene_to_file.bind(
			"res://Scenes/game_over.tscn").call_deferred()
	else:
		player_sprite.set_damaged_texture()
		$DamagedSpriteTimer.start(0.2)

func player_heal(health_gain):
	player_hp = player_hp + health_gain

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)
	laser_cooldown_timer.start(1)
	cooldown = true
	player_sprite.set_cooldown_texture()

func _on_cooldown_timer_timeout():
	cooldown = false
	player_sprite.set_default_texture()

func _on_damaged_sprite_timer_timeout():
	player_sprite.set_default_texture()
