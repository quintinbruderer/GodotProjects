extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bird

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process_input(true)
	bird = utils.get_main_node().get_node('birdy')
	pass

func _process(delta):
	position = Vector2(bird.position.x, position.y)
	
	
	pass