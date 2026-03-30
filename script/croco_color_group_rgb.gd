class_name CrocoColorInSceneRGB
extends Node3D

static var in_the_scene :Array[CrocoColorInSceneRGB] = []

signal on_color_updated(color:Color)

@export_range(0,255) var _red_0_255:int
@export_range(0,255) var _green_0_255:int
@export_range(0,255) var _blue_0_255:int

func set_random_color()->void:
	set_color(randf()*255.0,randf()*255.0,randf()*255.0)

func set_color_with_color(color:Color):
	set_color(color.r8,color.g8,color.b8)
	
func set_color_with_percent(red:float , green:float, blue:float):
	set_color(randf()*255.0,randf()*255.0,randf()*255.0)

func set_color(red_255:int,green_255:int,blue_255:int)->void:
	_red_0_255 = red_255
	_green_0_255 = green_255
	_blue_0_255 = blue_255
	_notify_color()
	
func _notify_color():
	on_color_updated.emit(get_current_color())
	
func set_red_255(red_255:int):
	_red_0_255 = red_255
	_notify_color()

func set_green_255(green_255:int):
	_green_0_255 = green_255
	_notify_color()

func set_blue_255(blue_255:int):
	_blue_0_255 = blue_255
	_notify_color()
	
func _ready() -> void:
	_notify_color()
	in_the_scene.append(self)
	#await get_tree().create_timer(5).timeout
	#queue_free()
	
func _exit_tree() -> void:
	in_the_scene.erase(self)

func get_current_color()->Color:
	return Color(_red_0_255, _green_0_255, _blue_0_255)

func get_as_unique_id()->String:
	return "".join([_red_0_255, _green_0_255, _blue_0_255])
