extends Sprite2D

var damaged_texture = load("res://Assets/Player/playerShip1_damaged.png")
var cooldown_texture = load("res://Assets/Player/playerShip1_cooldown.png")
var default_texture = load("res://Assets/Player/playerShip1_blue.png")


func set_damaged_texture():
	texture = damaged_texture

func set_cooldown_texture():
	texture = cooldown_texture

func set_default_texture():
	texture = default_texture
