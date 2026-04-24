extends Node2D

signal health_text_increase

var spawn_positions = null

var Powerup = preload("res://Scenes/powerup.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	spawn_positions = $P_SpawnPositions.get_children()

func spawn_powerup():
	var index = randi() % spawn_positions.size()
	var powerup = Powerup.instantiate()
	powerup.global_position = spawn_positions[index].global_position
	powerup.powerup_collected.connect(hp_increase)
	add_child(powerup)

func _on_timer_timeout():
	spawn_powerup()

func hp_increase():
	emit_signal("health_text_increase")
