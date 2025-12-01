extends Node
var level_progress = {
	"puzzle1": false, # За първата врата
	"puzzle2": false, # За втората врата
	"puzzle3": false  # За третата врата и т.н.
}

# (Опционално) Можеш да пазиш и от кой пъзел се връща играчът,
# за да го пуснеш на правилното място пред съответната врата.
var last_solved_puzzle = ""
