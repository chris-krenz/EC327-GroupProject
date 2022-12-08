extends RichTextLabel

var total : int
var string = "[b][right]%s[/right][/b]"
var actual = ""

func _ready():
	actual = string % 0
	bbcode_text = actual


# https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html
func _on_Wallet_winnings(winnings):
	total += winnings
	actual = string % total
	bbcode_text = actual
