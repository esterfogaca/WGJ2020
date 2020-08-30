extends Area2D 

func _on_Falling_body_entered(body):
	get_tree().change_scene("res://scenes/World.tscn")
	pass 
