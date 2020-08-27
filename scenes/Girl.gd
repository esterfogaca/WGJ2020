extends KinematicBody2D

var walk_speed = 150

var velocity = Vector2(0, 0)
 
#enum: conjunto de constantes
#process atualiza nosso game a cada frame
#porém queremos atualizar a cada frame no sistema de física
#pois aqui temos um corpo que pode colidir
# warning-ignore:unused_argument

func _process(delta):
	
	var walk_left = Input.is_action_pressed("left")
	
	var walk_right = Input.is_action_pressed("right")
	
	velocity = Vector2()
	
	if walk_left:
		velocity.x = -walk_speed
		
	elif walk_right:
		velocity.x = walk_speed
		
	velocity = move_and_slide(velocity)
	#velocity vai me retornar a minha própria velocidade e se eu colidir em algo volta a zerar.
	
	
