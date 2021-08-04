extends Node2D

var _new_InputName := preload("res://library/InputName.gd").new()

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed(_new_InputName.MOVE_LEFT):
        print("move left")