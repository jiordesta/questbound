extends Entity
class_name PlayerController

@onready var camera = preload("res://resource/scenes/components/custom_camera.tscn")

var states = [
	{'label':'idle', 'value':PlayerIdle},
	{'label':'run', 'value':PlayerRun},
	{'label':'hello', 'value':HelloState},
]

var items_detected = []

func instantiateCustomCamera():
	var new_camera = camera.instantiate()
	new_camera.set_script(CustomCamera)
	add_child(new_camera)
func initializeStateMachine():
	var new_node = Node.new()
	new_node.set_script(StateMachine)
	add_child(new_node)
	updateNode('state_machine', new_node)
	initializeStates(new_node)
func initializeStates(parent_node):
	var new_node = Node.new()
	parent_node.add_child(new_node)
	parent_node.initializeStates(new_node, states)
func itemInRange(area):
	if !area.is_in_group('item'): return
	var item = area.get_parent()
	if item.type != 'equipment': return
	items_detected.push_front(item)
func itemOutOfRange(area):
	if !area.is_in_group('item'): return
	var item = area.get_parent()
	if item.type != 'equipment': return
	var index = items_detected.find(item)
	items_detected.pop_at(index)
func _ready() -> void:
	instantiateCustomCamera()
	initializeStateMachine()
	updateCurrentStat('speed',25)
	updateNode('item_holder',$Texture/Item)
	updateNode('item_detection',$ItemDetection)
	$ItemDetection.connect("area_entered",itemInRange)
	$ItemDetection.connect("area_exited",itemOutOfRange)
func _process(delta: float) -> void:
	return
	#print(items_detected)
