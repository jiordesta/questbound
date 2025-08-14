extends State
class_name HelloState

var time = 0.0

func Exit():
	pass
func Enter():
	if not entity: return
	entity.updateProperty('state', self)
	time = 0.125
	return self
func Update(delta: float):
	if not entity: return
	
	time -= delta
	if time <= 0: Transition.emit(self,'idle')
	
func PhysicsUpdate(delta: float):
	if not entity: return
	entity.navigate(1000,delta)
