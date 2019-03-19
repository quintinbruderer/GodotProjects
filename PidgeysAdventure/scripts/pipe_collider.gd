extends Area2D

onready var sfx = audio_player.get_node('sounds')

func _on_areacollider_body_entered(body):
	if body.is_in_group(game.GROUP_BIRD):
		game.current_score += 1
		sfx.play('through')
		pass
	
	pass # replace with function body
