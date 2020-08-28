extends TextureRect

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/World.tscn")


func _on_Start_button_down() -> void:
	get_tree().change_scene("res://scenes/World.tscn")
