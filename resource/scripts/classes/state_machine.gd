extends Node
class_name StateMachine

var states = {}
var buffs = {}
var debuffs = {}

func initializeStates(node, entity_states, initial = 'idle'):
	for state in entity_states:
		var new_state: State = state.value.new()
		new_state.entity = get_parent()
		new_state.state_machine = self
		new_state.animation_player = new_state.entity.getNode('animation_player')
		new_state.name = state.label
		node.add_child(new_state)
		
		states[new_state.name.to_lower()] = new_state
		new_state.Transition.connect(stateTransitioned)
	states['current'] = states[initial].Enter()
func _process(delta):
	var current_state = states['current']
	if not current_state: return 
	current_state.Update(delta)
func _physics_process(delta):
	var current_state = states['current']
	if not current_state: return 
	current_state.PhysicsUpdate(delta)
func stateTransitioned(state, state_name):
	var new_state: State = states.get(state_name.to_lower())
	if !new_state: return
	states['current'] = new_state.Enter()
func overRideLogicState(state_name, item = null, entity = null):
	pass
