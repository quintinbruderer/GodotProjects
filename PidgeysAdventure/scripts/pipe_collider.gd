extends Area2D

var sounds

func _ready():
	sounds = audio_player.get_node('sounds')
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_areacollider_body_entered(body):
	if body.is_in_group(game.GROUP_BIRD):
		game.current_score += 1
		sounds.get_node('through').play()
		pass
	
	pass # replace with function body
