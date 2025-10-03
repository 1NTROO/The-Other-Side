extends Label

func on_start(ready_text: String) -> void:
	text = ready_text
	var l = text.length()
	get_parent().shape.set_size(Vector2(15 * l, 30))
