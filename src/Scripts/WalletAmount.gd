extends RichTextLabel

var string = "[b][right]%s[/right][/b]"
var actual = ""

func _ready():
	actual = string % 0
	bbcode_text = actual


func _on_Wallet_winnings(winnings):
	if winnings > 9999999:
		actual = "Overflow"
	else:
		actual = string % winnings
	bbcode_text = actual
