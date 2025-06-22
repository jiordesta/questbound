extends RigidBody2D
class_name Entity

var max_stats = Data.base_max_stats
var current_stats = Data.base_current_stats
var properties = Data.base_properties
var nodes = Data.base_nodes

#INITIALIZE

#UPDATE AND GETTER
func updateMaxStat(key,val):
	max_stats[key] = val
func getMaxStat(key):
	var existingAndNotNull = Helper.isValueInDictionaryExistingAndNotNull(max_stats, key)
	if not existingAndNotNull: return
	return max_stats[key]
func updateCurrentStat(key,val):
	current_stats[key] = val
func getCurrentStat(key):
	var existingAndNotNull = Helper.isValueInDictionaryExistingAndNotNull(current_stats, key)
	if not existingAndNotNull: return
	return current_stats[key]
func updateProperty(key,val):
	properties[key] = val
func getProperty(key):
	var existingAndNotNull = Helper.isValueInDictionaryExistingAndNotNull(properties, key)
	if not existingAndNotNull: return
	return properties[key]
func updateNode(key,val):
	nodes[key] = val
func getNode(key):
	var existingAndNotNull = Helper.isValueInDictionaryExistingAndNotNull(nodes, key)
	if not existingAndNotNull: return
	return nodes[key]
#PHYSICS
func navigate(speed, delta):
	var entity_speed = getCurrentStat('speed')
	var entity_direction = getProperty(('direction'))
	linear_velocity = (Vector2(speed * entity_speed,0) * delta).rotated(entity_direction.angle())
#TEXTURE
func playAnimation(animation_name):
	var animation_player:AnimationPlayer = getNode('animation_player')
	animation_player.play(animation_name)
