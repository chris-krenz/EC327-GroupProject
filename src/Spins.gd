extends RichTextLabel


var spins : int
var string = "[b][center]%s[/center][/b]"
var actual = ""

func _ready():
	spins = 5
	actual = string % 5
	bbcode_text = actual


func _on_Lever_pulled(_rand_base):
	if spins > 0:
		spins -= 1
	actual = string % spins
	bbcode_text = actual


func _on_Wallet_freespins(number):
	spins += 5
	actual = string % spins
	bbcode_text = actual


func _on_CoinReturn_animation_finished():
	if spins > 0:
		spins -= 1
	actual = string % spins
	bbcode_text = actual
