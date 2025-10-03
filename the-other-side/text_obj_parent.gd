class_name TextObjParent
extends Node2D

var TextObj = load("res://textobj.tscn")

var newTextObj

func _ready() -> void:
	var line = get_node("../Control/MarginContainer/VBoxContainer/HBoxContainer/PlayerLineInput")
	line.create_text.connect(create_new_textobj)
	
func create_new_textobj(new_text: String) -> void:
	newTextObj = TextObj.instantiate()
	add_child(newTextObj)
	var newTextLabel = newTextObj.get_node("Collider/Label")
	newTextLabel.on_start(new_text)
	newTextObj = null
