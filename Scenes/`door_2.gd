extends Area2D
var puzzle_scene_path = "res://Scenes/puzzle2.tscn"
func _on_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file(puzzle_scene_path)
