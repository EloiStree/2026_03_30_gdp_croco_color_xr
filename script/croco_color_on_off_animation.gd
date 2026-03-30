class_name CrocoColorOnOffAnimation
extends Node

@export var open_animation_name: String = "open_anim"
@export var close_animation_name: String = "close_anim"
@export var animation_player: AnimationPlayer

@export var last_set_is_open: bool = false


func _ready() -> void:
	set_is_open_state(last_set_is_open)

func set_is_open_state(is_open: bool):
	if is_open:
		set_as_open()
	else:
		set_as_closed()

func set_as_open():
	last_set_is_open = true
	if animation_player:
		animation_player.play(open_animation_name)

func set_as_closed():
	last_set_is_open = false
	if animation_player:
		animation_player.play(close_animation_name)
