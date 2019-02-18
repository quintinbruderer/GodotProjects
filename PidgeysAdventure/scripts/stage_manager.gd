extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var fader 
const stage_game = "res://stages/FlappyBird.tscn"
signal reset_game

func _ready():
	fader = get_node("fader")
	
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func reset_stage(stage_path):
	get_tree().get_root().set_disable_input(true)
	emit_signal("reset_game")
	self.layer = 10
	fader.play('fade_in')
	yield(fader,'animation_finished')
	get_tree().change_scene(stage_path)
	fader.play('fade_out')
	yield(fader,'animation_finished')
	self.layer = 0
	get_tree().get_root().set_disable_input(false)