extends Node2D

signal sprite_created(new_sprite)

const Player := preload("res://sprite/PC.tscn")

var _new_GroupName := preload("res://library/GroupName.gd").new()
var _new_ConvertCoord := preload("res://library/ConvertCoord.gd").new()


func _ready() -> void:
	_create_sprite(Player, _new_GroupName.PC, 1, 1)
	_create_sprite(Player, _new_GroupName.PC, 2, 2)
	_create_sprite(Player, _new_GroupName.PC, 3, 3)


func _create_sprite(
    prefab: PackedScene, group: String, x: int, y: int, x_offset: int = 0, y_offset: int = 0
) -> void:
	var _new_Sprite := prefab.instance() as Sprite
	_new_Sprite.position = _new_ConvertCoord.index_to_vector(x + x_offset, y + y_offset)
	_new_Sprite.add_to_group(group)
	
	add_child(_new_Sprite)
	emit_signal("sprite_created", _new_Sprite)