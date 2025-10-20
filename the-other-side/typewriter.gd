extends RichTextLabel

@export_subgroup("Settings")
@export var typing_speed: float = 40
var typing_time: float

func _ready() -> void:
	var line = get_node("../HBoxContainer/PlayerLineInput")
	line.narrator_signal.connect(display_text)

func display_text(new_text: String):
	text = "Narrator: "
	text += new_text
	visible_characters = 0
	typing_time = 0
	while visible_characters < get_total_character_count():
		typing_time += get_process_delta_time()
		visible_characters = typing_speed * typing_time as int
		await get_tree().process_frame
