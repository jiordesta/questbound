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
	
	if Input.is_action_just_pressed("drop"):
		var item = entity.getNode('item')
		if !item: return
		if item.status != Enum.WEAPON_STATUS.EQUIPPED: return
		item.drop()
	if Input.is_action_just_pressed("pick"):
		if entity.items_detected.size() <= 0: return
		var item_detected = entity.items_detected[0]
		if !item_detected: return
		var equipped_item = entity.getNode('item')
		if equipped_item:
			equipped_item.drop()
		if item_detected.status != Enum.WEAPON_STATUS.DROPPED: return
		item_detected.equip(entity)
		
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
