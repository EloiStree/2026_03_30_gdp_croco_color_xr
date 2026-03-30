class_name CrocoColorSetterTagRgb
extends Node

signal on_color_at_ready(color:Color)

@export var color_resource: CrocoColorResourceRgb

func _ready():
	#await get_tree().create_timer(0.01).timeout
	if color_resource :
		on_color_at_ready.emit(color_resource.color)
