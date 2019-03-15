extends AudioStreamPlayer

# class member variables go here, for example:
var main_menu
var day
var night
var bonus
var game_music
var fader


func _ready():
	main_menu = self.get_stream()
	day = load('res://audio/ogg/route38.ogg')
	night = load('res://audio/ogg/goldenrod.ogg')
	bonus = load('res://audio/ogg/gamecorner.ogg')
	game_music = [day,night,bonus]
	fader = get_node('audio_fader')
	# Called when the node is added to the scene for the first time.
	# Initialization here
	self.play()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func music_transition(song):
	fader.play('fade_out')
	yield(fader,'animation_finished')
	self.set_stream(song)
	self.play()
	fader.play('fade_in')
	pass
