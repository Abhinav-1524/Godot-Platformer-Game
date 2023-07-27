class_name World extends Node2D


@onready var game_over = $UI/GameOver
@onready var play = $Player

func _ready():
	game_over.visible = false
	
func visi():
	game_over.visible = true
	






func _on_female_body_entered(body):
	if body is GUY:
		visi()
		
		
		
