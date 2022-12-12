extends AnimatedSprite

var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var timer : int

var middle_icon : int
signal middle_icon(middle_icon)


func _on_Lever_pulled():
	if playing == false:
		rng.seed = hash("DidIspellthewordinWheel1Correctly?")
		rng.randomize()
		rng.randomize()
		timer = 150 + rng.randi_range(0, 50)
		timer -= timer % 12
		playing = true


func _process(_delta):
	if playing == true:
		timer -= 1
		if timer == 0:
			playing = false
			middle_icon = ceil(frame / 12)
			emit_signal("middle_icon", middle_icon)
