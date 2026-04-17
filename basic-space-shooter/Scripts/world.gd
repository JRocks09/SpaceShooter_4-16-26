extends Node2D

var Laser = preload("res://Scenes/player_laser.tscn")
var score = 0

func _on_player_spawn_laser(location: Variant):
	var l = Laser.instantiate()
	l.global_position = location
	add_child(l)

func score_calc():
	score += 10
	$Score.text = "SCORE: " + str(score)
