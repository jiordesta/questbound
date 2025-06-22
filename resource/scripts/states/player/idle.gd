extends PlayerParentState
class_name PlayerIdle

func Exit():
	pass
func Enter():
	if not entity: return
	entity.updateProperty('state', self)
	return self
func Update(delta: float):
	if not entity: return
	
	updateInputs()
	
	if down || left || right || up:
		Transition.emit(self, 'run')

func PhysicsUpdate(delta: float):
	if not entity: return
	entity.navigate(0,delta)
