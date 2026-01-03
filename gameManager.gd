extends Node

@export_group("Player Settings")
@export var player: Node2D

@export_group("Doors Configuration")
@export var closed_doors: Array[Node2D]
@export var open_doors: Array[Node2D]

@export_group("Spawn Positions")
@export var spawn_positions: Array[Vector2]

func _ready():
	# 1. Зареждаме записа (Това ще дръпне данните от Global)
	Global.load_game()
	update_level()

func update_level():
	# Скриваме всички отворени врати за безопасност
	for door in open_doors:
		if door: door.visible = false

	# Проверяваме Пъзели 1 до 9
	for i in range(1, 10): 
		var puzzle_key = "puzzle" + str(i)
		var index = i - 1 
		
		# Ако пъзелът е решен...
		if Global.level_progress.has(puzzle_key) and Global.level_progress[puzzle_key] == true:
			print("Отварям врата за: ", puzzle_key)
			
			# 1. Махаме затворената врата (Ако съществува)
			if index < closed_doors.size():
				var door = closed_doors[index]
				# Проверяваме is_instance_valid, за да не гръмне, ако вече е изтрита
				if is_instance_valid(door):
					door.queue_free() # ТВОЯТ СТАР МЕТОД
			
			# 2. Показваме отворената врата
			if index < open_doors.size():
				var door = open_doors[index]
				if is_instance_valid(door):
					door.visible = true

	# Позициониране на героя
	if Global.last_solved_puzzle != "" and player:
		var puzzle_num = Global.last_solved_puzzle.replace("puzzle", "").to_int()
		var spawn_idx = puzzle_num - 1
		
		if spawn_idx < spawn_positions.size():
			player.position = spawn_positions[spawn_idx]
