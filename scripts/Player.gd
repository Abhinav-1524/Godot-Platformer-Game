extends CharacterBody2D

@export var acceleration := 10
@export var gravity := 80
@export var max_speed :=550.0
@export var jump_force := 1000


@onready var anime = $AnimatedSprite2D


func _physics_process(delta):
		var input_vector := Vector2(Input.get_axis("Left","Right"),0)
			
		if input_vector.x != 0:
			if Input.is_action_pressed("Left"):
				anime.flip_h = true
			else:
				anime.flip_h = false
			velocity += input_vector.rotated(rotation) * acceleration
			velocity = velocity.limit_length(max_speed)
			move_and_slide()
			anime.play("run")
		else:
			anime.play("normal")
			velocity = velocity.move_toward(Vector2.ZERO,25)
			
		if !is_on_floor():
			velocity.y +=gravity
			if velocity.y > 1000:
				velocity.y = 1000
		else :
			if Input.is_action_pressed("Jump"):
				velocity.y = -jump_force
		move_and_slide()
	
