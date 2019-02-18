extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var fader 
const stage_game = "res://stages/FlappyBird.tscn"

func _ready():
	fader = get_node("fader")
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func reset_stage(stage_path):
	self.layer = 10
	fader.play('fade_in')
	yield(fader,'animation_finished')
	get_tree().change_scene(stage_path)
	fader.play('fade_out')
	yield(fader,'animation_finished')
	self.layer = 0