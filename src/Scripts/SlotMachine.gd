extends Node2D

#export (NodePath) var dropdown_path
#onready var dropdown = get_node(dropdown_path)
#
#func _ready():
#
#	dropdown.connect("item_selected", self, "_on_OptionButton_item_selected")
#
#	add_options()
#
#
#func add_options():
#	dropdown.add_item("Guaranteed Win")
#	dropdown.add_item("Hacker")
#	dropdown.add_item("Lucky")
#	dropdown.add_item("Normal")
#	dropdown.add_item("Guaranteed Loss")
