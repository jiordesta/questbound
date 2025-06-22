extends Node2D

@onready var entity = preload("res://resource/scenes/components/entity.tscn")


func spawnEntity(script):
	var new_entity = entity.instantiate()
	new_entity.set_script(script)
	$Entities.add_child(new_entity)

func _ready() -> void:
	spawnEntity(PlayerController)
