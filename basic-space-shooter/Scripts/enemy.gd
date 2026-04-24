extends Area2D

signal enemy_died

static var speed = 150
var enemy_hp = 1

func _physics_process(delta):
	global_position.y += speed * delta

func _process(_delta: float):
	if (global_position.y > 1100):
		queue_free()

func enemy_take_damage(damage):
	enemy_hp -= damage
	if enemy_hp <= 0:
		speed += 10
		print_debug("Enemy spawn speed at " + str(speed))
		emit_signal("enemy_died")
		queue_free()

func reset_enemy_speed():
	speed = 150
