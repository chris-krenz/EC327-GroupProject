extends AnimatedSprite

var rng       : RandomNumberGenerator = RandomNumberGenerator.new()

var rotations : int = 0
var timer     : int = 0
var ready     : bool = false

var left_icon : int
signal left_icon(left_icon)


func _ready():
	rng.seed  = hash("Supercalifragulisticexpialodocious")
	
	rotations = 0
	timer     = 0
	ready     = true


func _on_Lever_pulled(rand_base):
	rotations = 0
	ready     = false
	
	if playing == false:
		timer  += rand_base
		rng.randomize()
#		timer  += rng.randi_range(0, 120)		
#		timer  += rng.randi_range(0, 60)
#		timer  += rng.randi_range(0, 12)
		timer  += rng.randi_range(0, 0)
		timer   = (timer % 120)
		timer  -= (timer % 12)
		playing = true


func _on_Wheel1_animation_finished():
	rotations += 1


func _on_Wheel1_frame_changed():
	if frame == timer and rotations >= 2:
		frame     = timer	# Tiny delay here, so frame is explicitly set to ensure exact; 
							# this doesn't appear to be noticeable...
		playing   = false
		rotations = 0
		ready     = true
		
		left_icon = ceil(frame / 12)
		emit_signal("left_icon", left_icon)		# Wallet receives to calc result
