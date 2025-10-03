class_name InputComponent
extends Node2D

@export_subgroup("Settings")
@export var speed = 100

var input_horizontal: float = 0.0

func _physics_process(_delta: float) -> void:
	input_horizontal = Input.get_axis("move_left", "move_right")

func handle_horizontal_movement(body: CharacterBody2D):
	body.velocity.x = input_horizontal * speed
	
func get_jump_input() -> bool:
	return Input.is_action_just_pressed("jump")
	
