extends AnimatedSprite

onready var slider : VSlider = get_node("slider")	#'onready' same as func _ready()
onready var wheel1 : AnimatedSprite = get_node("Wheel1")

var dragging : bool = false


func _on_slider_drag_started():
	dragging = true
	

func _on_slider_drag_ended(_value_changed):	# triggered when mouse button released
	if dragging == true:
		dragging = false
		if slider.value > 10:
			frame = 25 + (slider.value/5)
			playing = true
			slider.value = 30
	else:
		slider.value = 30


func _on_Lever_animation_finished():
	playing = false


func _process(_delta):
	pass


func _on_VSlider_value_changed(value):
	if (dragging == true) and (value > 10):
		frame = 30 - value
	elif (dragging == true) and (value <= 10):
		playing = true
		dragging = false
		wheel1.playing = true
