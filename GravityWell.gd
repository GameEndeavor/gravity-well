extends Node2D

export var color := Color(0.0, 1.0, 0.0, 0.1)
export var influence_radius := 128.0
export var gravity := 0.0

func _input(event):
	if event is InputEventMouseMotion:
		position = get_global_mouse_position()
	elif event is InputEventMouseButton && event.is_pressed():
		if event.button_index == BUTTON_RIGHT:
			gravity = -1200

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		gravity = 128
	else:
		gravity = lerp(gravity, 0, 0.2)

func _draw():
	draw_circle(Vector2.ZERO, influence_radius, color)