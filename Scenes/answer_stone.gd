extends Area2D

# Тази променлива ще я цъкаме в Инспектора само за верния отговор
@export var is_correct_answer = false

# Дали паметникът е "събуден"
var is_active = false

func _ready():
	# Уверяваме се, че етикетът е скрит в началото
	$Label.visible = false

# Тази функция ще я извика Главният гроб
func activate_stone():
	is_active = true
	$Label.visible = true # Показваме текста

func _on_body_entered(body):
	# Реагираме САМО ако е активен и влиза играчът
	if is_active and body.name == "player":
		if is_correct_answer:
			print("Верен отговор!")
			
			# --- ЗАПИСВАНЕ НА ПРОГРЕСА (PUZZLE 4) ---
			Global.level_progress["puzzle4"] = true
			Global.last_solved_puzzle = "puzzle4"
			Global.save_game()
			
			call_deferred("change_scene")
		else:
			print("Грешен отговор!")
			# Тук можеш да накажеш героя (да го върнеш назад)
			body.position = Vector2(100, 300) # Сложи координатите на старта

func change_scene():
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
