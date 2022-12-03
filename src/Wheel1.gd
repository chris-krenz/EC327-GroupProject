extends AnimatedSprite

var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var timer : int


# TODO: Redo animation frame rate so each each side has a frame squarely aligned, with consistent spacing
func _on_Lever_pulled():
	if playing == false:
		timer = rng.randi_range(0, 100) + 100
		playing = true


func _process(_delta):
	if playing == true:
		timer -= 1
		if timer == 0:
			playing = false
