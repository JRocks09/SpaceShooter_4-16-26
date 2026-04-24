extends Area2D

var speed = 1000

func _physics_process(delta):
	global_position.y += -speed * delta

func _process(_delta: float):
	if global_position.y < -130:
		queue_free()

func _on_PlayerLaser_area_entered(area: Area2D):
	if area.is_in_group("enemies"):
		area.enemy_take_damage(1)
		queue_free()
