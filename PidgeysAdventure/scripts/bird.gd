extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_process_input(true)

	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	if rotation_degrees < -45:
		rotation_degrees = -45
		angular_velocity = 0	
	elif rotation_degrees > 75:
		rotation_degrees = 75
		
		
	if linear_velocity.y > 0:
		print(angular_velocity)
		angular_velocity = 2.5
	
	
func flap(): 
	linear_velocity = Vector2(linear_velocity.x,-250)
	angular_velocity = (-4)
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