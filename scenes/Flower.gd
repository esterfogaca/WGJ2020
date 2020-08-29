extends Area2D

func _ready():
	pass
	
	
func _on_Flower_body_entered(body):
	if body.get_name() == "Girl":
		queue_free()
