extends State
class_name PlayerParentState

var down = Input.is_action_pressed("ui_down")
var up = Input.is_action_pressed("ui_up")
var right = Input.is_action_pressed("ui_right")
var left = Input.is_action_pressed("ui_left")

func updateInputs():
	var direction = Vector2.ZERO
	
	down = Input.is_action_pressed("ui_down")
	up = Input.is_action_pressed("ui_up")
	right = Input.is_action_pressed("ui_right")
	left = Input.is_action_pressed("ui_left")
	
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	
	if direction != Vector2.ZERO:
		entity.updateProperty('direction', direction)
