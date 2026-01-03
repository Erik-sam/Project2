extends Node

@export_group("Player Settings")
@export var player: Node2D

@export_group("Doors Configuration")
# Списък със затворените врати
@export var closed_doors: Array[Node2D]
# Списък с отворените врати
@export var open_doors: Array[Node2D]

@export_group("Spawn Positions")
@export var spawn_positions: Array[Vector2]

func _ready():
	# 1. Зареждаме записа
	Global.load_game()
	print("--- НОВ GAME MANAGER ЗАРЕДЕН ---")
	print("Прогрес: ", Global.level_progress)
	
	update_level()

func update_level():
	# Скриваме всички отворени врати в началото
	for d in open_doors:
		if d: d.visible = false

	# Проверяваме Пъзели 1 до 9
	for i in range(1, 10):
		var key = "puzzle" + str(i)
		var index = i - 1
		
		if Global.level_progress.has(key) and Global.level_progress[key] == true:
			print("ОТКЛЮЧВАМ ВРАТА ", i)
			
			# Махаме затворената
			if index < closed_doors.size() and closed_doors[index] != null:
				closed_doors[index].visible = false
				closed_doors[index].process_mode = Node.PROCESS_MODE_DISABLED
				# Спираме колизията изрично, ако има такава
				var col = closed_doors[index].get_node_or_null("CollisionShape2D")
				if col: col.set_deferred("disabled", true)
			
			# Показваме отворената
			if index < open_doors.size() and open_doors[index] != null:
				open_doors[index].visible = true

	# Местим играча
	if Global.last_solved_puzzle != "" and player:
		var num = Global.last_solved_puzzle.replace("puzzle", "").to_int()
		var p_index = num - 1
		
		if p_index < spawn_positions.size():
			print("Местя играча на позиция: ", spawn_positions[p_index])
			player.position = spawn_positions[p_index]
