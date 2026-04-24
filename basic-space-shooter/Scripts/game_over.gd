extends Control

@export var level_scene : PackedScene 

func _ready():
	$Score.text = "FINAL SCORE: " + str(Global.score)

func _input(event: InputEvent):
	if event.is_action_pressed("Shoot"):
		await get_tree().create_timer(0.01).timeout
		get_tree().change_scene_to_packed(level_scene)
