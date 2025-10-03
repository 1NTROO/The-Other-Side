extends CharacterBody2D

@export_subgroup("Nodes")

@export_subgroup("Vars")
@export var target_scene: String

func _physics_process(delta: float) -> void:
	$GravityNode.handle_gravity(self, delta)
	$InputNode.handle_horizontal_movement(self)
	$JumpNode.handle_jump(self, $InputNode.get_jump_input())
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("yippee!")
	get_tree().change_scene_to_file("res://scenes/prototypescenes/" + target_scene + ".tscn")
	pass # Replace with function body.
