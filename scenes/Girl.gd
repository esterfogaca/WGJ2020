extends KinematicBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 50
const MAX_SPEED = 500
const GRAVITY = 100
const JUMP_HEIGHT = -1500
const RUN_SPEED = 1.8

var velocity = Vector2.ZERO
var score = 0

signal score_changed(value)

func _on_Flower_picked_flower() -> void:
	score = score + 1
	$AudioFlower.play() 
	emit_signal("score_changed", score)
	if score == 8:
		get_tree().change_scene("res://scenes/Final_image.tscn")
		
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("left"):
		if Input.is_action_pressed("run"):
			velocity.x = max(velocity.x-ACCELERATION, -MAX_SPEED) * RUN_SPEED
		else:
			velocity.x = max(velocity.x-ACCELERATION, -MAX_SPEED)
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
		
	elif Input.is_action_pressed("right"):
		if Input.is_action_pressed("run"):
			velocity.x = min(velocity.x+ACCELERATION, MAX_SPEED) * RUN_SPEED
		else:
			velocity.x = min(velocity.x+ACCELERATION, MAX_SPEED)
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		
	else: 
		$AnimatedSprite.play("idle")
		friction = true
	
	if is_on_floor():
		if Input.is_action_just_pressed("up_jump"):
			velocity.y = JUMP_HEIGHT
			$AudioJump.play()
		if friction == true:
			velocity.x = lerp(velocity.x, 0, 0.2)
	
	else:
		$AnimatedSprite.play("jump")
		if friction == true:
			velocity.x = lerp(velocity.x, 0, 0.05)
						
	
	velocity = move_and_slide(velocity, UP)
	#velocity vai me retornar a minha própria velocidade e se eu colidir em algo volta a zerar.
	
			

