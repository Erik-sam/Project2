extends Area2D
var main_scene_path = "res://Scenes/node_2d.tscn"
func _on_body_entered(body):
	if body.name == "player":
		print("Puzzle solved!")
		get_tree().change_scene_to_file(main_scene_path)
