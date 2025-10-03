extends StaticBody2D

var mouseOver: bool
var mousePos: Vector2 = Vector2.ZERO
var offset: Vector2

func _on_mouse_entered() -> void:
	mouseOver = true

func _on_mouse_exited() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_released("click"):
		mouseOver = false
	
	offset = mousePos - get_global_mouse_position()
	
	if Input.is_action_pressed("click") and mouseOver and offset != Vector2.ZERO:
		global_position -= offset
		
	mousePos = get_global_mouse_position()
	
