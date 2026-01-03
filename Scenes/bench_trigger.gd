extends Area2D
var main_scene_path = "res://Scenes/node_2d.tscn"
func _on_body_entered(body):
	if body.name == "player":
		Global.level_progress["puzzle2"] = true
		Global.last_solved_puzzle = "puzzle2"
		Global.save_game()
		print("Puzzle solved!")
		get_tree().change_scene_to_file(main_scene_path)
