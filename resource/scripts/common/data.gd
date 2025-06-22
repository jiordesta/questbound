extends Node

var base_max_stats = {
	'intelligence': Constant.DEFAULT_STAT_VALUE,
	'strength': Constant.DEFAULT_STAT_VALUE,
	'agility': Constant.DEFAULT_STAT_VALUE,
	'health': Constant.DEFAULT_STAT_VALUE,
	'energy': Constant.DEFAULT_STAT_VALUE,
	'mana': Constant.DEFAULT_STAT_VALUE,
	'speed': Constant.DEFAULT_STAT_VALUE,
}

var base_current_stats = {
	'intelligence': Constant.DEFAULT_STAT_VALUE,
	'strength': Constant.DEFAULT_STAT_VALUE,
	'agility': Constant.DEFAULT_STAT_VALUE,
	'health': Constant.DEFAULT_STAT_VALUE,
	'energy': Constant.DEFAULT_STAT_VALUE,
	'mana': Constant.DEFAULT_STAT_VALUE,
	'speed': Constant.DEFAULT_STAT_VALUE,
}

var base_properties = {
	'direction': Vector2.ZERO,
	'state': null,
	'spawn_point': Vector2.ZERO,
	'targets': [],
	'group': '',
	'type': '',
	'leader': null,
	'name': ''
}

var base_nodes = {
	'state_machine': null,
	'animation_player': null,
	'navigation_agent': null,
	'hitbox': null,
	'rays': null,
	'item': null
}
