extends PlayerParentState
class_name PlayerRun

func Exit():
	pass
func Enter():
	if not entity: return
	entity.updateProperty('state', self)
	return self
func Update(delta: float):
	if not entity: return
	
	updateInputs()
	
	if !down and !left and !right and !up:
		Transition.emit(self, 'idle')
func PhysicsUpdate(delta: float):
	if not entity: return
	entity.navigate(100,delta)
