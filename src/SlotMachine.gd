extends Node2D

export (NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)
var diff_test

func _ready():
	
	dropdown.connect("item_selected", self, "_on_OptionButton_item_selected")
	
	add_options()
	
	
func add_options():
	dropdown.add_item("GuaranteeWin")
	dropdown.add_item("Hacker")
	dropdown.add_item("Lucky")
	dropdown.add_item("Normal")
	dropdown.add_item("GuaranteeLoss")


func _on_OptionButton_item_selected(index):
	diff_test = dropdown.get_item_text(index)


func _on_CheckButton_button_down():
	pass # Replace with function body.


func _on_CheckButton_button_up():
	pass # Replace with function body.
