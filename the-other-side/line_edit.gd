extends LineEdit

var InputParser = load("res://classes/text_parser.gd")

@export_subgroup("Strings")
@export var allowed_strings: Array
@export var narrator_buildup: Array
@export var narrator_random: Array

signal create_text(text: String)

signal narrator_signal(text: String)

var narrate_start: bool = false
var t: float = 0
var narrator_index: int = 0
var input_parser = null
@export var text_obj_parent: Node

func _ready() -> void:
	self.grab_focus()
	input_parser = InputParser.new()

func _process(delta: float) -> void:
	t += delta
	if (!narrate_start and t > 0.2):
		var narrator_text = narrator_buildup[narrator_index]
		narrator_signal.emit(narrator_text)
		narrator_index += 1
		narrate_start = true

func _on_text_submitted(new_text: String) -> void:
	if (new_text.is_empty()):
		return
	
	var instruction = input_parser.parse(new_text)
	
	if (instruction == InstructionSet.CREATE):
		if (allowed_strings.is_empty()):
			if (narrator_index < narrator_buildup.size()):
				var narrator_text = narrator_buildup[narrator_index]
				narrator_signal.emit(narrator_text)
				narrator_index += 1
			else:
				var narrator_text = narrator_random.pick_random()
				narrator_signal.emit(narrator_text)
			create_text.emit(new_text)
			
		else:
			if (allowed_strings.has(new_text)):
				create_text.emit(new_text)
			else:
				if (narrator_index < narrator_buildup.size()):
					var narrator_text = narrator_buildup[narrator_index]
					narrator_signal.emit(narrator_text)
					narrator_index += 1
				else:
					var narrator_text = narrator_random.pick_random()
					narrator_signal.emit(narrator_text)
				pass
	
	self.set_text("")
	
	self.grab_focus()
	
