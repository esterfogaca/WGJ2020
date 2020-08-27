extends KinematicBody2D

var walk_speed = 150
const UP = Vector2(0, -1)
var velocity = Vector2(0, 0)


func _process(delta):
	
	var walk_left = Input.is_action_pressed("left")
	
	var walk_right = Input.is_action_pressed("right")
	
	velocity = Vector2()
	
	velocity.y +=250
	
	if walk_left:
		velocity.x = -walk_speed
		$AnimatedSprite.play("walk_left")
		$AnimatedSprite.flip_h = true
		
	elif walk_right:
		velocity.x = walk_speed
		$AnimatedSprite.play("walk_right")
		$AnimatedSprite.flip_h = false
	else: 
		velocity.x = 0
	
	if is_on_floor():
		if Input.is_action_pressed("up_jump"):
			velocity.y = -9500
	
	velocity = move_and_slide(velocity, UP)
	#velocity vai me retornar a minha própria velocidade e se eu colidir em algo volta a zerar.
	
	
