extends AnimatedSprite

# ICON LOOKUP TABLE
# 0: Diamond
# 1: Clover
# 2: Question
# 3: Bar
# 4: Banana
# 5: Watermelon
# 6: Grapes
# 7: Lemon
# 8: Peach
# 9: Cherry

var icon1     : int = 0
var icon2     : int = 0
var icon3     : int = 0
var result    : int = 0
var free_spin : bool = false
var winnings  : int = 0		# Also set in WalletAmount...
var total     : int = 0

onready var coin : Node2D = get_node("/root/Machine/Node2D")

signal winnings(winnings)
signal freespins(number)


func _ready():
#	winnings = 1000
#	frame = winnings / 1000
	total = 1000


func _process(delta):
	winnings = total - (1000*((coin.selected == true) as int))
	frame = winnings / 1000
	
	
func _on_Wheel1_left_icon(left_icon):
	icon1 = left_icon


func _on_Wheel2_middle_icon(middle_icon):
	icon2 = middle_icon


func _on_Wheel3_right_icon(right_icon):
	icon3 = right_icon
	_identify_result(icon1, icon2, icon3)


func _identify_result(icon1, icon2, icon3):
	if icon1 == 0 and icon2 == 0 and icon3 == 0:
		total += 250000		# Jackpot
	elif icon1 == icon2 and icon2 == icon3:
		total += 10000		# Triple other than Jackpot
	elif icon1 == icon2 or icon2 == icon3 or icon3 == icon1: 
		total += 5000		# Double
	else:
		result = 0		# No matches

	if (icon1 == 9) or (icon2 == 9) or (icon3 == 9):
		free_spin = true 
		emit_signal("freespins", 5)
	
#	result = 0
#	winnings += result		# Want to add some kind of multiplier?
	
#	frame = winnings / 1000

#	emit_signal("winnings", winnings)		# for winnings display...*


#func _on_Node2D_grabbed():
#	if winnings >= 1000:
#		winnings -= 1000
#		frame = winnings / 1000
#		emit_signal("winnings", winnings)
#
#
#func _on_Node2D_released():
#	winnings += 1000
#	frame = winnings / 1000
#	emit_signal("winnings", winnings)

func _on_Spins_returned():
	total += 1000
