extends Sprite2D

var main_scene_path = "res://Scenes/node_2d.tscn"

var timer := 0.0
var on := false
@onready var area: Area2D = $Area2D

func _process(delta: float) -> void:
	timer += delta
	if timer >= 2.0:
		timer = 0.0
		on = !on
		modulate = Color(1,1,1,1) if not on else Color(0.9,0.9,0.9,1)
signal column_touched

func _ready() -> void:
	area.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name == "player":
		column_touched.emit()
		Global.level_progress["puzzle9"] = true
		Global.last_solved_puzzle = "puzzle9"
		Global.checkpoint_id = "Checkpoint_9"
		Global.save_game()
		get_tree().change_scene_to_file(main_scene_path)
