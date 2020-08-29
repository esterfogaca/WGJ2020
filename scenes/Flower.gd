extends Area2D

signal picked_flower
	
func _on_Flower_body_entered(body):
	emit_signal("picked_flower")
	if body.get_name() == "Girl":
		queue_free()
