extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bird

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true)
	bird = utils.get_main_node().get_node('pidgey')
	pass

func _physics_process(delta):
	position = Vector2(bird.position.x, position.y)	
	pass
	
func get_true_pos(): 
	return position + offset
	pass