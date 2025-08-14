extends Node2D

var entity: Entity
var status = Enum.WEAPON_STATUS.DROPPED
var slash_area
var pick_area
var type = 'equipment' #TO BECOME AN ENUM LATER
@onready var animation_player = $AnimationPlayer

func _ready():
	slash_area = Global.slash_area_object.instantiate()
	pick_area = Global.pick_area_object.instantiate()
	call_deferred('drop')
func initialize():
	pass
func removeAndReparentNode(node):
	get_parent().remove_child(self)
	node.add_child(self)
	global_position = entity.global_position
	#Global.custom_camera.applyShake(1,10)
func equip(_entity: Entity):
	entity = _entity
	#$AnimationPlayer.play("equip")
	removeAndReparentNode(entity.getNode('item_holder'))
	entity.updateNode('item',self)
	add_child(slash_area)
	remove_child(pick_area)
	status = Enum.WEAPON_STATUS.EQUIPPED
func drop():
	#$AnimationPlayer.play('drop')
	if entity:
		removeAndReparentNode(Global.entity_node)
		entity.updateNode('item',null)
		remove_child(slash_area)
	add_child(pick_area)
	status = Enum.WEAPON_STATUS.DROPPED
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'drop':
		status = Enum.WEAPON_STATUS.DROPPED
	elif anim_name == 'equip':
		status = Enum.WEAPON_STATUS.EQUIPPED
