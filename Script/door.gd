# Вратата - опростена проверка
extends Area2D

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	# Проверяваме дали това е CharacterBody2D (играчът)
	if body is CharacterBody2D:
		print("Играчът се блъсна!")
		get_tree().change_scene_to_file("res://Scenes/puzzle1.tscn")
