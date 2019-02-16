extends Area2D


func _ready():
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_areacollider_body_entered(body):
	if body.is_in_group(game.GROUP_BIRD):
		game.current_score += 1
		pass
	
	pass # replace with function body
