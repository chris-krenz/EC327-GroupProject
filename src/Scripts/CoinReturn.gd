extends AnimatedSprite


func _on_Button_pressed():
	playing = true


func _on_CoinReturn_animation_finished():
	playing = false
