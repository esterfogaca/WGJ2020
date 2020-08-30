extends KinematicBody2D

func _ready():
	pass
	

func _on_sensor_body_entered(body):
	get_node("AnimationPlayer").play("plataform_shaking")
	pass 


func _on_sensor_body_exited(body):
	get_node("AnimationPlayer").stop
	get_node("Sprite").set_pos(Vector2())
	pass
