extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sfx

func _ready():

	sfx = audio_player.get_node('sounds')
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_menu_play_pressed():
#	get_node("menu_play").set_disabled(true)
	sfx.play('cry')
	stage_manager.reset_stage(stage_manager.stage_game)
	pass # replace with function body
