extends Node2D

var score = 0 


func _on_Flower_flower_collected():
	score += 1
	print("score "+ String(score))
	
