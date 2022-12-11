extends AnimatedSprite

var rng       : RandomNumberGenerator = RandomNumberGenerator.new()

var rotations : int = 0
var timer     : int = 0
var ready     : bool = false

var middle_icon : int
signal middle_icon(middle_icon)


func _ready():
	rng.seed  = hash("DidISpellTheWheel1WordCorrectly?")
	
	rotations = 0
	timer     = 0
	ready     = true


func _on_Lever_pulled(rand_base):
	rotations = 0
	ready     = false
	
	if playing == false:
		timer  += rand_base
		rng.randomize()
		rng.randomize()			# Redundancy necessary to distinguish wheels...
#		timer  += rng.randi_range(0, 120)
#		timer  += rng.randi_range(0, 60)
#		timer  += rng.randi_range(0, 12)
		timer  += rng.randi_range(0, 0)
		timer   = (timer % 120)
		timer  -= (timer % 12)
		playing = true


func _on_Wheel2_animation_finished():
	rotations += 1


func _on_Wheel2_frame_changed():
	if frame == timer and rotations >= 4:
		frame     = timer	# Tiny delay here, so frame is explicitly set to ensure exact; 
							# this doesn't appear to be noticeable...
		playing   = false
		rotations = 0
		ready     = true
		
		middle_icon = ceil(frame / 12)
		emit_signal("middle_icon", middle_icon)		# Wallet receives to calc result
