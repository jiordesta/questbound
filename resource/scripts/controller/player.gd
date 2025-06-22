extends Entity
class_name PlayerController

@onready var camera = preload("res://resource/scenes/components/custom_camera.tscn")

var states = [
	{'label':'idle', 'value':PlayerIdle},
	{'label':'run', 'value':PlayerRun},
]

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
func _ready() -> void:
	instantiateCustomCamera()
	initializeStateMachine()
