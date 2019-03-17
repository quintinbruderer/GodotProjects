extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var cry
var sound_effects = []

func _ready():
	cry = load('res://audio/ogg/pidgey.ogg') 
	
	var dir = Directory.new()
	if dir.open('res://audio/wav') == OK:
		dir.list_dir_begin(true,true)
		#true skip navigational and hiddel
		var file = dir.get_next()
		while file != '':
			print(file)
			if file.ends_with('wav'): #protects from random files
				sound_effects.append(file)
			file = dir.get_next()
			
		for sound in sound_effects:
			var sound_player = AudioStreamPlayer.new()
			sound_player.stream = load('res://audio/wav/' + sound)
#			print(file.get_basename())
			sound_player.set_name(sound.get_basename())
			self.add_child(sound_player)

	var cry = AudioStreamPlayer.new()
	cry.stream = load('res://audio/ogg/pidgey.ogg')
	cry.set_name('cry')
	self.add_child(cry)
	#convert pidgey to wav, and add it with the rest
	
	pass
