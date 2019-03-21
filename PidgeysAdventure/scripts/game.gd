extends Node

const GROUP_PIPES = 'pipes'
const GROUP_GROUNDS = 'grounds'
const GROUP_BIRD = 'bird'

var old_best_score = 0
var best_score = 0 setget _set_best_score
var current_score = 0	setget _set_current_score

var shiny = false
var day = true
onready var music_player = audio_player.get_node('music')

const bronze_score = 1
const silver_score = 2
const gold_score = 3
const platinum_score = 4

signal best_score_changed
signal current_score_changed
#signal current_score_two_digit

func _ready():
	var time = OS.get_time()
	if time.hour < 6 or time.hour > 18:
		day = false
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
	_shiny_chance()
	
func _shiny_chance():
	var chance = randi()%10 + 1
	if chance == 1:
		shiny = true
	else:
		shiny = false
		
func day_shifter():
	var chance = randi()%4 + 1
	if chance == 1:
		day = !day	
	if day == true and music_player.get_stream() != music_player.day:
		music_player.music_transition(music_player.game_music[0])
	elif day == false and music_player.get_stream() != music_player.night: 
		music_player.music_transition(music_player.game_music[1])