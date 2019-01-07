extends Node2D

const ground_scene = preload('res://scenes/ground.tscn')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	for i in range(2):
		spawn_and_move()
	pass

func spawn_next_ground():
	var new_ground_piece = ground_scene.instance()
	new_ground_piece.position = position
	new_ground_piece.connect('destroyed_ground', self, 'spawn_and_move')
	get_node('ground_parent_container').add_child(new_ground_piece)
	pass
	
func next_position():
	position = get_position() + Vector2(480,0)
	pass

func spawn_and_move():
	spawn_next_ground()
	next_position()
	pass