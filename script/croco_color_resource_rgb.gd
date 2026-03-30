class_name CrocoColorResourceRgb
extends Resource

@export var color:Color

func get_as_hexa_ffffff() -> String:
	return color.to_html(false).trim_prefix("#")
	
