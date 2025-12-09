extends Area2D

# Текстът за Минотавъра
var riddle_text = "In ancient legends, every wrong step in the labyrinth leads to me.\nI have the strength of a man, but the head of a bull.\nWho am I?"

func _on_body_entered(body):
	# Проверка за играча
	if body is Player:
		print("!!! ГЕРОЯТ ВЛЕЗЕ В ГРОБА !!!")
		# 1. Сменяме текста в етикета на героя
		var label = body.get_node_or_null("taskLabel1")
		label.text = riddle_text
			
		# 2. Активираме отговорите (с малки букви, както са в сцената ти)
		
