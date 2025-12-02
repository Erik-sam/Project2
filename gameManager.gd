extends Node

# --- ТУК ЩЕ ВЛАЧИМ ОБЕКТИТЕ С МИШКАТА ---
@export_group("Player Settings")
@export var player: Node2D  # Тук ще сложиш героя

@export_group("Puzzle 1 Doors")
@export var p1_closed_door: Node2D # Затворената врата 1
@export var p1_open_door: Node2D   # Отворената врата 1

@export_group("Puzzle 2 Doors")
@export var p2_closed_door: Node2D # Затворената врата 2
@export var p2_open_door: Node2D   # Отворената врата 2

func _ready():
	print("GameManager стартира!")
	
	# 1. Зареждаме записа
	Global.load_game()
	
	# 2. Обновяваме света според записа
	update_level()

func update_level():
	# --- НАСТРОЙКА НА ВРАТА 1 ---
	# Скриваме отворената по подразбиране, ако я има
	if p1_open_door: p1_open_door.visible = false
	
	if Global.level_progress["puzzle1"] == true:
		print("Отварям Врата 1")
		if p1_closed_door: p1_closed_door.queue_free() # Махаме затворената
		if p1_open_door: p1_open_door.visible = true   # Показваме отворената

	# --- НАСТРОЙКА НА ВРАТА 2 ---
	if p2_open_door: p2_open_door.visible = false
	
	if Global.level_progress["puzzle2"] == true:
		print("Отварям Врата 2")
		if p2_closed_door: p2_closed_door.queue_free()
		if p2_open_door: p2_open_door.visible = true

	# --- ПОЗИЦИЯ НА ГЕРОЯ ---
	if player:
		if Global.last_solved_puzzle == "puzzle1":
			player.position = Vector2(158, 2473) # Твоите координати
		elif Global.last_solved_puzzle == "puzzle2":
			player.position = Vector2(-531, 1891) # Твоите координати
