class_name  CrocoColorClipFacade3D
extends Node3D

@export var is_open_state:bool

@export var tip_point:Node3D
@export var cable_point:Node3D
@export var clip_interaction_shape:CollisionShape3D
@export var clip_color:CrocoColorInSceneRGB

signal  on_open_state_updated(is_closed:bool)


func set_open_state(is_closed:bool):
	is_open_state = is_closed
	on_open_state_updated.emit(is_open_state)

func get_open_state()->bool:
	return is_open_state

func get_tip_point()->Node3D:
		return tip_point

func get_tip_point_global_position()->Vector3:
		return tip_point.global_position

func get_cable_point()->Node3D:
		return cable_point

func get_cable_point_global_position()->Vector3:
		return cable_point.global_position
		

static var in_scene:Array[CrocoColorClipFacade3D]		

func _ready() -> void:
	print ("CrocoColorClipFacade3D _ready called", in_scene.size())
	if not in_scene.has(self):
		in_scene.append(self)
	
	
func _exit_tree() -> void:
	print("CrocoColorClipFacade3D _exit_tree called", in_scene.size())
	if in_scene.has(self):
		in_scene.erase(self)
	
