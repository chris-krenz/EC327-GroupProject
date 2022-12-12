extends Button


func _ready():
	pass


func _on_slotbuttoncredits_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://CreditsScene.tscn") # Warning: Return unused: OK
