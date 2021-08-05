extends Node2D

signal sprite_created(new_sprite)

const ArrowX := preload("res://sprite/ArrowX.tscn")
const ArrowY := preload("res://sprite/ArrowY.tscn")
const Dwarf := preload("res://sprite/Dwarf.tscn")
const Floor := preload("res://sprite/Floor.tscn")
const Wall := preload("res://sprite/Wall.tscn")

const Player := preload("res://sprite/PC.tscn")

var _new_GroupName := preload("res://library/GroupName.gd").new()
var _new_ConvertCoord := preload("res://library/ConvertCoord.gd").new()
var _new_DungeonSize := preload("res://library/DungeonSize.gd").new()
var _new_InputName := preload("res://library/InputName.gd").new()

var _initialized: bool = false

#func _ready() -> void:
    #_create_sprite(Player, _new_GroupName.PC, 1, 1)

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed(_new_InputName.INIT_WORLD):
        _create_sprite(Player, _new_GroupName.PC, 1, 1)
        set_process_unhandled_input(false)
        for i in range(_new_DungeonSize.MAX_X):
            for j in range(_new_DungeonSize.MAX_Y):
                _create_sprite(Floor, _new_GroupName.FLOOR, i, j)

func _create_sprite(
    prefab: PackedScene, group: String, x: int, y: int, x_offset: int = 0, y_offset: int = 0
) -> void:
    var _new_Sprite := prefab.instance() as Sprite
    _new_Sprite.position = _new_ConvertCoord.index_to_vector(x + x_offset, y + y_offset)
    _new_Sprite.add_to_group(group)
    
    add_child(_new_Sprite)
    emit_signal("sprite_created", _new_Sprite)