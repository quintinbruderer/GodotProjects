extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process_input(true)
	linear_velocity = Vector2(100,linear_velocity.y)

	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	print(rotation_degrees)
		
	if get_rotation_degrees() < -30:
		set_rotation_degrees(-30)
		set_angular_velocity(0)
#	elif get_rotation_degrees() > 140:
#		set_rotation_degrees(140)
#
		
	if get_linear_velocity().y > 0:
		set_angular_velocity(5)
	
	
func flap(): 
	set_linear_velocity(Vector2(get_linear_velocity().x,-300))
	set_angular_velocity(-3)
	pass	
	
func _input(event):
	if event is InputEventScreenTouch:
#		print(event.pressed)
#		print(event.is_pressed())
		flap()
		
#	if event.is_action_pressed('ui_accept'):
#		print(event)
#		# ui accept is like enter, space, return 
		
#	if event is InputEventKey:
#		print (event.scancode)