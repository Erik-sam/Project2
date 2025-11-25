extends Sprite2D

@onready var area: Area2D = $Area2D


var player_in_range := false

func _ready():
	
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body is Player:
		player_in_range = true
		
		print("Играчът приближи вратата")

func _on_body_exited(body):
	if body is Player:
		player_in_range = false
	
		print("Играчът се отдалечи от вратата")

func _input(event):
	# Проверка за натискане на клавиш E (или друг клавиш)
	if player_in_range and event is InputEventKey:
		if event.pressed and event.keycode == KEY_E:
			interact()

func interact():
	print("Взаимодействие с вратата")
	# Преминаване към puzzle1 сцената
	get_tree().change_scene_to_file("res://Scenes/puzzle1.tscn")
