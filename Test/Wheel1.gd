extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var toggle = false


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_TestButton_pressed():
	if playing == false:
		playing = true
	elif playing == true:
		get_tree().change_scene("res://GameOver_scene.tscn")
	else: 
		playing = false



func _on_TestButton_button_down():
	pass # Replace with function body.


func _on_TestButton_toggled(button_pressed):
	pass