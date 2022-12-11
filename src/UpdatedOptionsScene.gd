extends Control

export (NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)

func _ready():
	add_options()
	
	
func add_options():
	dropdown.add_item("Easy")
	dropdown.add_item("Medium")
	dropdown.add_item("Hard")
	dropdown.add_item("Impossible")
	dropdown.add_item("Auto Win")

func _on_Button_pressed():
	get_tree().change_scene("res://Slot_Title_Menu.tscn")
