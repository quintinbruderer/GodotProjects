extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const pipe_scene = preload('res://scenes/pipes.tscn')
const avg_pipe_thickness = 58
const ground_height = 165
const pipe_x_offset = 120
const pipe_y_offset = 110
var viewport_size

func _ready():
	viewport_size = get_viewport_rect().size
	initial_position()
	
	for i in range(3):
		spawn_and_move()
	
	pass

func initial_position():
	randomize()
	
	var init_pos = Vector2()
	init_pos.x = (viewport_size.x) + (avg_pipe_thickness/2)
	init_pos.y = rand_range(pipe_y_offset,viewport_size.y-ground_height-pipe_y_offset)
	position = init_pos
	pass

func spawn_next_pipe():
	var new_pipes = pipe_scene.instance()
	new_pipes.position = position
	new_pipes.connect('destroyed_pipes',self, 'spawn_and_move')
	get_node("pipe_parent_container").add_child(new_pipes)
	pass
	
func next_position():
	randomize()
	
	var next_pos = position
	next_pos.x += avg_pipe_thickness/2 + pipe_x_offset + avg_pipe_thickness/2
	next_pos.y = rand_range(pipe_y_offset,viewport_size.y-ground_height-pipe_y_offset)
	position = next_pos
	pass
	
func spawn_and_move():
	spawn_next_pipe()
	next_position()
	pass