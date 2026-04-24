extends Node2D

var Laser = preload("res://Scenes/player_laser.tscn")

@onready var player_ref = $Player
@onready var powerup_timer:Timer = $P_SpawnTimer

func _ready():
	Global.score = 0

func _process(_delta: float):
	if player_ref != null:
		if player_ref.player_hp != 0:
			$PlayerHP.text = "HP: " + str(player_ref.player_hp)
	else: pass

func _on_player_spawn_laser(location: Variant):
	var l = Laser.instantiate()
	l.global_position = location
	add_child(l)

func score_calc():
	Global.score += 10
	$Score.text = "SCORE: " + str(Global.score)
	p_timer_start()

func health_calc():
	$PlayerHP.text = "HP: " + str($Player.player_hp)

func p_timer_start():
	if Global.score % 50 == 0:
		powerup_timer.start(2)
		print_debug("powerup timer began")
