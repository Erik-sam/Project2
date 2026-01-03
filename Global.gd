extends Node

const SAVE_PATH = "user://savegame.save"

var level_progress = {
	"puzzle1": false, "puzzle2": false, "puzzle3": false,
	"puzzle4": false, "puzzle5": false, "puzzle6": false,
	"puzzle7": false, "puzzle8": false, "puzzle9": false
}

var last_solved_puzzle = "" 

func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(level_progress)
		file.store_var(last_solved_puzzle)
		print("Global: Играта е записана успешно!")

func load_game():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			level_progress = file.get_var()
			last_solved_puzzle = file.get_var()
			print("Global: Играта е заредена!")
	else:
		print("Global: Няма файл със записана игра.")
