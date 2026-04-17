extends Area2D

signal spawn_laser(location)

@onready var muzzle = $Muzzle

var speed = 300
var input_vector = Vector2.ZERO
var player_hp = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	input_vector.x = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")  
	input_vector.y = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	
	global_position += input_vector * speed * delta
	
	if Input.is_action_just_pressed("Shoot"):
		shoot_laser()

func _on_area_entered(area: Area2D):
	if area.is_in_group("enemies"):
		area.enemy_take_damage(1)
		player_take_damage(1)
		print_debug("Player HP: " + str(player_hp))

func player_take_damage(damage):
	player_hp = player_hp - damage
	if player_hp <= 0:
		queue_free()

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)
