extends Node

const GROUP_PIPES = 'pipes'
const GROUP_GROUNDS = 'grounds'
const GROUP_BIRD = 'bird'

var old_best_score = 0
var best_score = 0 setget _set_best_score
var current_score = 0	setget _set_current_score

const bronze_score = 1
const silver_score = 2
const gold_score = 3
const platinum_score = 4

signal best_score_changed
signal current_score_changed
#signal current_score_two_digit

func _ready():
	set_process_input(true)
	stage_manager.connect('reset_game', self, '_on_game_reset')
	pass

func _set_best_score(new_val):
	if best_score < new_val:
		old_best_score = best_score
		best_score = new_val
		emit_signal('best_score_changed')


func _set_current_score(new_val):
	current_score = new_val
	emit_signal('current_score_changed')
	

func _on_game_reset():
	current_score = 0