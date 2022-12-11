extends Node2D

# This is the one part of the project was inspired by Youtuber Bramwell: https://www.youtube.com/watch?v=iSpWZzL2i1o

var selected : bool = false
var point
var nodes = []
var ready : bool = true

onready var coin        : Sprite = get_node("Coin")
onready var wallet      : AnimatedSprite = get_node("/root/Machine/Wallet")
#onready var wallet_disp : RichTextLabel = get_node("/root/Machine/WalletAmount")
#onready var spins_disp  : RichTextLabel = get_node("/root/Machine/Spins")

signal grabbed()
signal released()
signal winnings(winnings)


func _ready():
	nodes = get_tree().get_nodes_in_group("zone")
	point = nodes[1].global_position
	nodes[1].select()


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (Input.is_action_just_pressed("click") \
		and coin.visible == false \
		and wallet.winnings >= 1000 \
		and ready == true):
#		wallet.frame  = wallet.winnings / 1000
#		ready = false
#		emit_signal("grabbed")
		selected      = true
		coin.visible  = true
	if (Input.is_action_just_released("click") \
		and coin.visible == true):
#		emit_signal("released")
#		wallet.winnings += 1000
#		wallet.frame     = wallet.winnings / 1000
		selected      = false
		coin.visible  = false


func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
	else:
		coin.visible = false
		global_position = lerp(global_position, point, 50 * delta)
		rotation = lerp_angle(rotation, 0, 10 * delta)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false

			if global_position.distance_to(nodes[0].global_position) < 25:
				nodes[0].select()
				point = nodes[1].global_position
				wallet.total -= 1000
			else:
#				ready = true
				nodes[1].select()
				point = nodes[1].global_position
