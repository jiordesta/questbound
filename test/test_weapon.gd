extends Node2D

@export var entity: Entity

var status = Enum.WEAPON_STATUS.DROPPED
var slash_area = null
var pick_area = null
var type = 'equipment' #TO BECOME AN ENUM LATER

func _ready():
	if status == Enum.WEAPON_STATUS.EQUIPPED:
		entity.updateNode('item', self)
		slash_area = $SlashArea
		pick_area = $PickArea
		remove_child(pick_area)
	elif status == Enum.WEAPON_STATUS.DROPPED:
		slash_area = $SlashArea
		pick_area = $PickArea
		remove_child(slash_area)
		$AnimationPlayer.play('drop')
func removeAndReparentNode(node):
	get_parent().remove_child(self)
	node.add_child(self)
	global_position = entity.global_position
	#Global.custom_camera.applyShake(1,10)
func equip(_entity: Entity):
	entity = _entity
	$AnimationPlayer.play("equip")
	removeAndReparentNode(entity.getNode('item_holder'))
	entity.updateNode('item',self)
	add_child(slash_area)
	remove_child(pick_area)
func drop():
	$AnimationPlayer.play('drop')
	removeAndReparentNode(Global.entity_node)
	entity.updateNode('item',null)
	remove_child(slash_area)
	add_child(pick_area)
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'drop':
		status = Enum.WEAPON_STATUS.DROPPED
	elif anim_name == 'equip':
		status = Enum.WEAPON_STATUS.EQUIPPED
