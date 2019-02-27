extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_menu_play_pressed():
	get_node("menu_play").set_disabled(true)
	stage_manager.reset_stage(stage_manager.stage_game)
	pass # replace with function body
