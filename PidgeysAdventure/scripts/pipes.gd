extends StaticBody2D

const avg_pipe_thickness = 58
onready var cam_pos

signal destroyed_pipes

func _ready():
	cam_pos = utils.get_main_node().get_node('camera')
	set_process(true)
	pass

func _process(delta):
	if cam_pos == null: return
	
	if get_global_position().x + avg_pipe_thickness/2 < cam_pos.get_true_pos().x:
		queue_free()
		emit_signal('destroyed_pipes')
		pass
	print(cam_pos.position.x,cam_pos.get_position().x)
	pass
