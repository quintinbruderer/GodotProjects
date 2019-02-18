extends RigidBody2D

onready var state = StartingState.new(self)
signal state_changed

const forward_speed = 140
const flap_height = 250
var collider_body

#---state reference numbers
const start_num = 0
const flap_num = 1
const hit_num = 2
const grounded_num = 3
#----

func _ready():
	set_process_input(true)
	add_to_group(game.GROUP_BIRD)
	pass

func _process(delta):
	state.update(delta)
	pass
	
func _input(event):
	state.input(event)
	pass
	
func _on_bird_rigid_body_entered(other_body):
	collider_body = other_body
	if state.has_method('on_body_enter'):
		state.on_body_enter(other_body)
	pass
	
func set_new_state(new_state_num):
	state.exit()
	
	if new_state_num == start_num:
		state = StartingState.new(self)
	elif new_state_num == flap_num:
		state = FlappingState.new(self)
	elif new_state_num == hit_num:
		state = HitState.new(self)
	elif new_state_num == grounded_num:
		state = GroundedState.new(self)
		
	emit_signal('state_changed',self)
	pass
	
func get_state():
	if state is StartingState:
		return start_num
	elif state is FlappingState:
		return flap_num
	elif state is HitState:
		return hit_num
	elif state is GroundedState:
		return grounded_num
	pass

	
#--------------------

class StartingState:
	var bird
	var play_gravity_scale
	
	func _init(bird):
		self.bird = bird
		play_gravity_scale = bird.gravity_scale
		bird.gravity_scale = 0
		bird.get_node('bird_anim_player').play('flying')
		bird.linear_velocity = Vector2(forward_speed,bird.linear_velocity.y)
	
		pass
	
	func update(delta):
		pass
	
	func input(event):
		pass
		
	func exit():
		bird.gravity_scale = play_gravity_scale
		bird.get_node('bird_anim_player').stop()
		bird.get_node('bird_sheet').set_position(Vector2(0,0))
		pass
		
#---------------------		

class FlappingState:
	var bird
	
	func _init(bird):
		self.bird = bird
		bird.linear_velocity = Vector2(forward_speed,bird.linear_velocity.y)
		flap()
		pass
	
	func update(delta):
		if bird.get_rotation_degrees() < -30:
			bird.set_rotation_degrees(-30)
			bird.set_angular_velocity(0)
#	elif get_rotation_degrees() > 140:
#		set_rotation_degrees(140)
#
		
		if bird.get_linear_velocity().y > 0:
			bird.set_angular_velocity(3)
			bird.get_node('bird_anim_player').play('idle')
		pass
	
	func input(event):
		if event is InputEventScreenTouch and event.pressed:
#			print(event)
			flap()
		pass
		
	func on_body_enter(other_body):
		bird.get_node('bird_anim_player').stop()
		if other_body.is_in_group(game.GROUP_PIPES):
			bird.set_new_state(bird.hit_num)
		elif other_body.is_in_group(game.GROUP_GROUNDS):
			bird.set_new_state(bird.grounded_num)
			
		pass
	
	func flap(): 
		bird.set_linear_velocity(Vector2(bird.get_linear_velocity().x,-flap_height))
		bird.set_angular_velocity(-8)
		bird.get_node('bird_anim_player').play('flap')
		pass	
		
	func exit():
		pass		

#---------------------		

class HitState:
	var bird
	
	func _init(bird):
		self.bird = bird
		bird.set_linear_velocity(Vector2(forward_speed/20,0))
		bird.add_collision_exception_with(bird.collider_body)
		pass
	
	func update(delta):
		pass
	
	func input(event):
		pass
		
	func on_body_enter(other_body):
		if other_body.is_in_group(game.GROUP_GROUNDS):
			bird.set_new_state(bird.grounded_num)
		pass	
		
	func exit():
		pass		
		
#---------------------		

class GroundedState:
	var bird
	
	func _init(bird):
		self.bird = bird
		
		pass
	
	func update(delta):
	
		pass
	
	func input(event):
		pass
		
	func exit():
		pass		


