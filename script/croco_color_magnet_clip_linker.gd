## When unclip, unparent the given node root
## When clip, find a magnet script to parent to given given node 

class_name CrocoColorMagnetClipLinker
extends Node


@export var node_to_parent:Node3D
@export var node_clip_point:Node3D



func set_clip_as_open(value:bool):
	if value:
		unparent_node_to_world()
	else:
		parent_node_to_magnet_area_in_scene()


func unparent_node_to_world():
	if node_to_parent:
		detach_to_root(node_to_parent)


func parent_node_to_magnet_area_in_scene():
	if not node_to_parent:
		return

	#var areas :Array[CrocoColorMagnetArea3D] = CrocoColorMagnetArea3D.find_area_containing_point(node_clip_point.global_position)
	#if areas.size() > 0:
		#areas[0].add_child(node_to_parent)
		#set_parent(node_to_parent,areas[0])
		#
		
static func detach_to_root(node: Node) -> void:
	if node:
		node.reparent(node.get_tree().current_scene)

static func set_parent(node: Node, new_parent: Node) -> void:
	if node == null or new_parent == null:
		return
		
	#if keep_global and node is Node3D:
		#var global = node.global_transform
		#node.reparent(new_parent)
		#node.global_transform = global
	#else:
	node.reparent(new_parent)
