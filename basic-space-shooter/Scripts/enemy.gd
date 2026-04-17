extends Area2D

signal enemy_died

@export var speed = 150
var enemy_hp = 1

func _physics_process(delta):
	global_position.y += speed * delta

func enemy_take_damage(damage):
	enemy_hp -= damage
	if enemy_hp <= 0:
		emit_signal("enemy_died")
		queue_free()
