extends AnimatedSprite

var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var timer : int

var right_icon : int
signal right_icon(right_icon)

func _on_Lever_pulled():
	if playing == false:
		rng.seed = hash("Isweartheserandomseednamesarenotindicativeofboredom")
		rng.randomize()
		rng.randomize()
		rng.randomize()
		timer = 200 + rng.randi_range(0, 50)
		timer -= timer % 12
		playing = true


func _process(_delta):
	if playing == true:
		timer -= 1
		if timer == 0:
			playing = false
			right_icon = ceil(frame / 12)
			emit_signal("right_icon", right_icon)
