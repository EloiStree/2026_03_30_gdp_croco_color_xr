class_name CrocoColorSetterTagRgb
extends Node

signal on_color_at_ready(color:Color)
signal on_color_updated(color:Color)

@export var color_resource: CrocoColorResourceRgb

func _ready():
	#await get_tree().create_timer(0.01).timeout
	if color_resource :
		on_color_at_ready.emit(color_resource.color)


func set_color(color:Color):
	color_resource.color= color
	on_color_updated.emit(color)
	
