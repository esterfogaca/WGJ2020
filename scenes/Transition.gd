extends Area2D


func _on_Transition_body_entered(body):
#	print("ok")
	get_tree().change_scene("res://scenes/Tileset_2.tscn")
	pass # Replace with function body.
