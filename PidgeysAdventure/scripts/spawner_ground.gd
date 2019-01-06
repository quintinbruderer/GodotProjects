extends Node2D

const ground_scene = preload('res://scenes/ground.tscn')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	spawn_next_ground()
	pass

#func _process(delta):
func spawn_next_ground():
	var new_ground_piece = ground_scene.instance()
	new_ground_piece.position = position
	get_node('ground_parent_container').add_child(new_ground_piece)
	pass
	
func next_position():
	pass
