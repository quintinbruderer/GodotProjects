extends StaticBody2D

onready var cam_pos = utils.get_main_node().get_node('camera')
onready var sprite = get_node('ground_sprite')
onready var day = sprite.get_texture()
onready var night = load("res://sprites/ground-n.png")

signal destroyed_ground

func _ready():
	if game.day == false:
		sprite.set_texture(night)
	else:
		sprite.set_texture(day)
	set_process(true)
	add_to_group(game.GROUP_GROUNDS)
	pass

func _process(delta):
	if cam_pos == null: return
	
	if get_global_position().x + 480 + 48 < cam_pos.get_true_pos().x:
		#48 One tilesize for backwards roll
		queue_free()
		emit_signal('destroyed_ground')
		pass
	#print(cam_pos.position.x,cam_pos.get_position().x)
	pass


