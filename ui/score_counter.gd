extends HBoxContainer

func display_digits(n):
	var s = "%08d" % n
	$Score.text = s
