extends Sprite2D

@onready var area: Area2D = $Area2D

func _ready():
	area.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Player:
		if Puzzle1Answer.puzzle_solved:
			Global.level_progress["puzzle1"] = true
			Global.last_solved_puzzle = "puzzle1"
			_go_to_main_scene()
		else:
			print("Puzzle not solved yet.")  # или махни това

func _go_to_main_scene():
	var new_scene = load("res://scenes/node_2d.tscn")
	get_tree().change_scene_to_packed(new_scene)
