extends Node

@onready var slash_area_object = preload("res://resource/scenes/components/slash_area.tscn")
@onready var pick_area_object = preload("res://resource/scenes/components/pick_area.tscn")
@onready var weapon_object = preload("res://resource/scenes/components/weapon.tscn")

var custom_camera:CustomCamera
var entity_node
