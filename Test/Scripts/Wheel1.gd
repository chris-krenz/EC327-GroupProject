extends AnimatedSprite

var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var timer : int

var left_icon : int
signal left_icon(left_icon)


func _on_Lever_pulled():
	if playing == false:
		rng.seed = hash("Supercalifragulisticexpialodocious")
		rng.randomize()
		timer = 100 + rng.randi_range(0, 50)
		timer -= timer % 12
		playing = true


func _process(_delta):
	if playing == true:
		timer -= 1
		if timer == 0:
			playing = false
			left_icon = ceil(frame / 12)
			emit_signal("left_icon", left_icon)
