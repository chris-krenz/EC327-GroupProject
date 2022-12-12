extends Control

func _on_Button_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://Slot_Title_Menu.tscn")
	
