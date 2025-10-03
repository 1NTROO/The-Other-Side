extends LineEdit

var InputParser = load("res://classes/text_parser.gd")

signal create_text(text: String)

var input_parser = null
@export var text_obj_parent: Node

func _ready() -> void:
	self.grab_focus()
	input_parser = InputParser.new()

func _on_text_submitted(new_text: String) -> void:
	if (new_text.is_empty()):
		return
	
	var instruction = input_parser.parse(new_text)
	
	if (instruction == InstructionSet.CREATE):
		create_text.emit(new_text)
	
	self.set_text("")
	
	self.grab_focus()
	
