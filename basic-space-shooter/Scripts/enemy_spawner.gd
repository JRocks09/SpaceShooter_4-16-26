extends Node2D

signal add_score

var spawn_positions = null

var Enemy = preload("res://Scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	spawn_positions = $SpawnPositions.get_children()

func spawn_enemy():
	var index = randi() % spawn_positions.size()
	var enemy = Enemy.instantiate()
	enemy.global_position = spawn_positions[index].global_position
	enemy.enemy_died.connect(enemy_spawned_death)
	add_child(enemy)

func _on_spawn_timer_timeout():
	spawn_enemy()

func enemy_spawned_death():
	emit_signal("add_score")
