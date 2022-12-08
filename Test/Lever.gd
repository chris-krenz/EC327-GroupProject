extends AnimatedSprite

onready var slider : VSlider = get_node("slider")	#'onready' same as func _ready()

var dragging : bool = false

signal pulled


func _on_slider_drag_started():
	dragging = true
	

func _on_slider_drag_ended(_value_changed):	# triggered when mouse button released
	if dragging == true:
		dragging = false
		if slider.value > 10:
			frame = (slider.value/5) as int + 25
			self.playing = true
	slider.value = 30


func _on_Lever_animation_finished():
	self.playing = false


func _on_VSlider_value_changed(value):
	if (dragging == true) and (value > 10):
		frame = 30 - value
	elif (dragging == true) and (value <= 10):
		self.playing = true
		dragging = false
		emit_signal("pulled")	# Picked up by Wheel(s)
