extends Node

const GROUP_PIPES = 'pipes'
const GROUP_GROUNDS = 'grounds'
const GROUP_BIRD = 'bird'

var best_score = 0 setget _set_best_score
var current_score = 50	setget _set_current_score

signal best_score_changed
signal current_score_changed
#signal current_score_two_digit

func _ready():
	set_process_input(true)
	stage_manager.connect('reset_game', self, '_on_game_reset')
	pass

func _set_best_score(new_val):
	best_score = new_val
	emit_signal('best_score_changed')


func _set_current_score(new_val):
	current_score = new_val
	emit_signal('current_score_changed')
	

func _on_game_reset():
	current_score = 0