extends Node

func _on_Girl_score_changed(value) -> void:
	$Label.set_text(String(value))
