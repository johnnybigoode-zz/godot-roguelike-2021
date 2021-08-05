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
        #set all dungeon space to floor
        for i in range(_new_DungeonSize.MAX_X):
            for j in range(_new_DungeonSize.MAX_Y):
                _create_sprite(Floor, _new_GroupName.FLOOR, i, j)

        #create a block of wall
        var shift: int = 2
        var min_x: int = _new_DungeonSize.CENTER_X - shift
        var max_x: int = _new_DungeonSize.CENTER_X + shift + 1
        var min_y: int = _new_DungeonSize.CENTER_Y - shift
        var max_y: int = _new_DungeonSize.CENTER_Y + shift + 1
    
        for i in range(min_x, max_x):
            for j in range(min_y, max_y):
                _create_sprite(Wall, _new_GroupName.WALL, i, j)

        #add dwarfs
        _create_sprite(Dwarf, _new_GroupName.DWARF, 3, 3)
        _create_sprite(Dwarf, _new_GroupName.DWARF, 14, 5)
        _create_sprite(Dwarf, _new_GroupName.DWARF, 7, 11)

        #add other icons
        _create_sprite(ArrowX, _new_GroupName.ARROW, 0, 12)
        _create_sprite(ArrowY, _new_GroupName.ARROW, 5, 0)

func _create_sprite(
    prefab: PackedScene, group: String, x: int, y: int, x_offset: int = 0, y_offset: int = 0
) -> void:
    var _new_Sprite := prefab.instance() as Sprite
    _new_Sprite.position = _new_ConvertCoord.index_to_vector(x + x_offset, y + y_offset)
    _new_Sprite.add_to_group(group)
    
    add_child(_new_Sprite)
    emit_signal("sprite_created", _new_Sprite)