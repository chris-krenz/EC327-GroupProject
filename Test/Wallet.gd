extends AnimatedSprite

var icon1 : int = 0
var icon2 : int = 0
var icon3 : int = 0

var result : int = 0
### What should the combinations be? ###
# 1 (3 bars) : Jackpot?			(diamond?)
# 2 (3 match): Partial win?
# 3 (>cherry): free spin?
# 4 (other)  : subtract money?
# 5 (?)      : wildcard?


var winnings : int = 0
signal winnings(winnings)


func _on_Wheel1_left_icon(left_icon):
	icon1 = left_icon


func _on_Wheel2_middle_icon(middle_icon):
	icon2 = middle_icon


func _on_Wheel3_right_icon(right_icon):
	icon3 = right_icon
	_identify_result(icon1, icon2, icon3)


func _identify_result(icon1, icon2, icon3):
	# could implement this various ways...
	# if then blocks?
	# match blocks?: https://docs.godotengine.org/en/latest/tutorials/scripting/gdscript/gdscript_basics.html#match
	# other?
	
	# winnings = ~result...
	#$Winning.play()
	emit_signal("winnings", winnings)		# for winnings display...
	
	
