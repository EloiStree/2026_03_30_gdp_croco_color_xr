class_name CrocoColorClipFacadeToRgbEvent
extends Node

signal on_croco_clip_script_found(clip: CrocoColorClipFacade3D)
signal on_croco_clip_color_found(clip: Color)

@export var last_clip_found:CrocoColorClipFacade3D
@export var last_color_found:Color

func push_in_node(node:Node):
	if node is CrocoColorClipFacade3D:
		var croco: CrocoColorClipFacade3D = node
		last_clip_found = croco
		on_croco_clip_script_found.emit(croco)
		if croco and croco.clip_color:
			var color:Color = croco.clip_color.get_current_color()
			last_color_found = color
			on_croco_clip_color_found.emit(color)
		
