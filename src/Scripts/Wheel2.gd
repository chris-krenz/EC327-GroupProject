extends AnimatedSprite

# DIFFICULTY LOOKUP

#	0: "Normal"		: ~"fair"
#	1: "Easier"		: ~doubled odds
#	2: "Very Easy"	: always within 1-2
#	3: "Auto Win"	: triple match always
#	4: "Impossible"	: match never


var difficulty  : int = 3
var rng         : RandomNumberGenerator = RandomNumberGenerator.new()
var rotations   : int = 0
var timer       : int = 0
var ready       : bool = false
var middle_icon : int

signal middle_icon(middle_icon)


func _ready():
	rng.seed  = hash("DidISpellTheWheel1WordCorrectly?")
	rotations = 0
	timer     = 0
	ready     = true


func _on_OptionButton_item_selected(index):
	difficulty = index
	print(difficulty)


func _on_Lever_pulled(rand_base):
	rotations = 0
	ready     = false
	
	if playing == false:
		timer = rand_base
		rng.randomize()
		rng.randomize()			# Redundancy necessary to distinguish wheels...

		match difficulty:
			3:	# Normal
				timer  += rng.randi_range(0, 119)
				timer   = (timer % 120)
			2:	# Lucky
				timer  += rng.randi_range(0, 47)
				timer   = (timer % 120)
			1:	# Hacker
				timer  += rng.randi_range(0, 12)
				timer   = (timer % 120)
			0:	# Guaranteed Win
				timer  += rng.randi_range(0, 0)
				timer   = (timer % 120)
			4:	# Guaranteed Lose
				timer  += rng.randi_range(24, 36)
				timer   = (timer % 120)
		
		timer  -= (timer % 12)
		playing = true


func _on_Wheel2_animation_finished():
	rotations += 1


func _on_Wheel2_frame_changed():
	if frame == timer and rotations >= 4:
		if timer == 0:		#janky to correct for animation
			frame = 0
		frame     = timer - 1
		playing   = false
		rotations = 0
		ready     = true

		middle_icon = ceil(timer / 12)	# Warning: Int div, loses precision: OK
		emit_signal("middle_icon", middle_icon)		# Wallet receives to calc result
