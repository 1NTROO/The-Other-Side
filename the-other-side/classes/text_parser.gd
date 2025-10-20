class_name TextParser

var InstructionSet = load("res://classes/instruction_set.gd")

func parse(text):
	match text:
		'right': return InstructionSet.WALK_RIGHT
		'go right': return InstructionSet.WALK_RIGHT
		'walk': return InstructionSet.WALK_RIGHT
		'walk right': return InstructionSet.WALK_RIGHT
		
		'stop': return InstructionSet.STOP
				
	return InstructionSet.CREATE
