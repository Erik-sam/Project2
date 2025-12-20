extends Node2D

@export var next_scene := "res://scenes/node_2d.tscn"

@onready var area := $Area2D

var active := false

func _ready():
	area.body_entered.connect(_on_body_entered)

func set_active(value: bool):
	active = value
	print("Chest active =", active)

func _on_body_entered(body):
	if body is Player and active:
		get_tree().change_scene_to_file(next_scene)
