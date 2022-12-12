extends Button


func _ready():
	pass


func _on_slotmainmenu_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://Slot_Title_Menu.tscn")
