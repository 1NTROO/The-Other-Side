extends CharacterBody2D

@export_subgroup("Nodes")

func _physics_process(delta: float) -> void:
	$GravityNode.handle_gravity(self, delta)
	$InputNode.handle_horizontal_movement(self)
	
	move_and_slide()
