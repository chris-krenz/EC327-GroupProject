extends Button


func _ready():
	pass


func _on_slotbuttoncredits_pressed():
	get_tree().change_scene("res://CreditsScene.tscn")
