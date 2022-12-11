extends AnimatedSprite

# LOOKUP TABLE
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

var icon1 : int = 0
var icon2 : int = 0
var icon3 : int = 0
var match1_2 : bool = false
var match2_3 : bool = false
var match3_1 : bool = false
var matchall : bool = false

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
	if icon1 == 0 or icon2 == 0 or icon3 == 0:
		print("diamond")
	match1_2 = (icon1 == icon2)
	print("1_2")
	print(match1_2)
	match2_3 = (icon2 == icon3)
	print("2_3")
	print(match2_3)
	match3_1 = (icon3 == icon1)
	print("3_1")
	print(match3_1)
	matchall = (match1_2 and match2_3)
	print("and")
	print(matchall)

#	if icon1 == icon2 and icon2 == icon3:
	# could implement this various ways...
	# if then blocks?
	# match blocks?: https://docs.godotengine.org/en/latest/tutorials/scripting/gdscript/gdscript_basics.html#match
	# other?
	
	# winnings = ~result...
	
	emit_signal("winnings", winnings)		# for winnings display...
	
	
