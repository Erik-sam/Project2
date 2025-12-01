extends Node2D

func _ready():
	# 1. Уверяваме се, че отворената врата е скрита по подразбиране
	if has_node("openDoor"):
		$openDoor.visible = false
	
	# 2. ПРОВЕРКА ЗА ПЪЗЕЛ 1 (Това е твоят случай сега)
	if Global.level_progress.has("puzzle1") and Global.level_progress["puzzle1"] == true:
		
		# А. Показваме отворената врата
		if has_node("openDoor"):
			$openDoor.visible = true
			
		# Б. Махаме напълно затворената врата
		# Тъй като 'Door' е дете на Node2D2, достъпваме го с $Door
		if has_node("Door"):
			$Door.queue_free()
