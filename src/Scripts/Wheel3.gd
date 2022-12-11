extends AnimatedSprite

var difficulty : String = "Lucky"
var rng        : RandomNumberGenerator = RandomNumberGenerator.new()
var rotations  : int = 0
var timer      : int = 0
var ready      : bool = false
var right_icon : int

signal right_icon(right_icon)


func _ready():
	rng.seed  = hash("ISwearTheseHashSeedsAreNotIndicativeOfBoredom")
	
	rotations = 0
	timer     = 0
	ready     = true


func _on_Lever_pulled(rand_base):
	rotations = 0
	ready     = false
	
	if playing == false:
		timer  += rand_base
		rng.randomize()
		rng.randomize()
		rng.randomize()			# Redundancy necessary to distinguish wheels...
		match difficulty:
			"GuaranteeLoss":
				timer  += rng.randi_range(81, 120)
			"Normal":
				timer  += rng.randi_range(0, 120)
			"Lucky":
				timer  += rng.randi_range(0, 60)
			"Hacker":
				timer  += rng.randi_range(0, 12)
			"GuaranteeWin":
				timer  += rng.randi_range(0, 0)
		timer   = (timer % 120)
		timer  -= (timer % 12)
		playing = true


func _on_Wheel3_animation_finished():
	rotations += 1


func _on_Wheel3_frame_changed():
	if frame == timer and rotations >= 6:
		if timer == 0:		#janky to correct for animation
			frame = 0
		frame = timer - 1
		playing   = false
		rotations = 0
		ready     = true
		
		right_icon = ceil(timer / 12)
		emit_signal("right_icon", right_icon)		# Wallet receives to calc result
