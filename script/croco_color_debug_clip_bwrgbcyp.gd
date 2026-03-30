class_name  CrocoColorDebugClipBWRGBCYP
extends Node


@export var clip_in_scene : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_black : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_white : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_red : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_green : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_blue : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_cyan : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_yellow : Array[CrocoColorClipFacade3D]
@export var clip_in_scene_purple : Array[CrocoColorClipFacade3D]

# Called when the node enters the scene tree
func _ready():
	var timer = Timer.new()               # create a Timer
	timer.wait_time = 1.0                 # 1 second interval
	timer.autostart = true                # start automatically
	timer.one_shot = false                # repeat indefinitely
	add_child(timer)                      # add to the scene tree
	timer.timeout.connect(refresh_debug_var_in_inspector)  # connect timeout signal

func refresh_debug_var_in_inspector()->void:
	
	clip_in_scene.clear()	
	clip_in_scene_black.clear()
	clip_in_scene_white.clear()
	clip_in_scene_red.clear()
	clip_in_scene_green.clear()
	clip_in_scene_blue.clear()
	clip_in_scene_cyan.clear()
	clip_in_scene_yellow.clear()
	clip_in_scene_purple.clear()

	
	clip_in_scene.assign(CrocoColorClipFacade3D.in_scene)
	for clip in clip_in_scene:
		var color:Color = clip.clip_color.get_current_color()
		if color.r8==0 and color.g8==0 and color.b8==0:
			clip_in_scene_black.append(clip)
		elif color.r8==255 and color.g8==255 and color.b8==255:
			clip_in_scene_white.append(clip)
		elif color.r8==255 and color.g8==0 and color.b8==0:
			clip_in_scene_red.append(clip)
		elif color.r8==0 and color.g8==255 and color.b8==0:
			clip_in_scene_green.append(clip)
		elif color.r8==0 and color.g8==0 and color.b8==255:
			clip_in_scene_blue.append(clip)
		elif color.r8==0 and color.g8==255 and color.b8==255:
			clip_in_scene_cyan.append(clip)
		elif color.r8==255 and color.g8==255 and color.b8==0:
			clip_in_scene_yellow.append(clip)
		elif color.r8==255 and color.g8==0 and color.b8==255:
			clip_in_scene_purple.append(clip)	
	
	
