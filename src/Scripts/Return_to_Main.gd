extends Control

func _on_Credits_ready():
	pass # Replace with function body.
	$BackGroundMusic.play()

func _on_Button_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://Slot_Title_Menu.tscn")


