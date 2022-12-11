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
var winnings  : int = 0
var free_spin : bool = false

signal winnings(winnings)
signal freespins(number)


func _on_Wheel1_left_icon(left_icon):
	icon1 = left_icon


func _on_Wheel2_middle_icon(middle_icon):
	icon2 = middle_icon


func _on_Wheel3_right_icon(right_icon):
	icon3 = right_icon
	_identify_result(icon1, icon2, icon3)


func _identify_result(icon1, icon2, icon3):
	if icon1 == 0 and icon2 == 0 and icon3 == 0:
		result = 250000		# Jackpot
	elif icon1 == icon2 and icon2 == icon3:
		result = 10000		# Triple other than Jackpot
	elif icon1 == icon2 or icon2 == icon3 or icon3 == icon1: 
		result = 5000		# Double
	else:
		result = 0		# No matches

	if (icon1 == 9) or (icon2 == 9) or (icon3 == 9):
		free_spin = true 
		emit_signal("freespins", 5)
		
	winnings += result		# Want to add some kind of multiplier?

	frame = winnings / 1000

	emit_signal("winnings", winnings)		# for winnings display...
