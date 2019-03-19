extends StaticBody2D

const avg_pipe_thickness = 58

onready var cam_pos = utils.get_main_node().get_node('camera')
onready var building_sprite = get_node('sprite_building')
onready var building_day = building_sprite.get_texture()
onready var building_night = load("res://sprites/pipebtm-n.png")

signal destroyed_pipes

func _ready():
	if game.day == false:
		building_sprite.set_texture(building_night)
	else:
		building_sprite.set_texture(building_day)
	pass
	set_process(true)
	add_to_group(game.GROUP_PIPES)
	pass

func _process(delta):
	if cam_pos == null: return
	
	if get_global_position().x + avg_pipe_thickness/2 < cam_pos.get_true_pos().x:
		queue_free()
		emit_signal('destroyed_pipes')
		pass
	#print(cam_pos.position.x,cam_pos.get_position().x)
	pass


