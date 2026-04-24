extends Area2D

signal powerup_collected

@export var speed = 150

func _physics_process(delta):
	global_position.y += speed * delta

func collect():
	emit_signal("powerup_collected")
	queue_free()
