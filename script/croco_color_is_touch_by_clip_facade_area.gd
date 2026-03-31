
class_name CrocoColorIsTouchByClipFacadeArea
extends Area3D

@export var is_active:bool=false
@export var in_zone_nodes:Array[Node3D]
@export var clean_for_null_interval_in_seconds:float=0.1
@export var allow_if_have_this_script_as_node: Script

signal on_active_state_changed(is_active:bool)
signal on_down()
signal on_up()
signal on_node_entering_valide(node:Node)
signal on_node_exiting_valide(node:Node)


func is_pressed()->bool:
	return in_zone_nodes.size()>0

func is_released()->bool:
	return not is_pressed()

func check_if_active():
	_set_as_active(in_zone_nodes.size()>0)

func _set_as_active(value_on:bool):
	var changed:bool= value_on != is_active
	is_active = value_on
	if changed:
		if is_active:
			#print('Down')
			on_down.emit()
		else :
			#print('Up')
			on_up.emit()
		#print('Changed')
		on_active_state_changed.emit(value_on)
			
func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	var cleanup_timer := Timer.new()
	cleanup_timer.wait_time = clean_for_null_interval_in_seconds
	cleanup_timer.autostart = true
	cleanup_timer.timeout.connect(_remove_null_in_array_and_check)
	add_child(cleanup_timer)

func _remove_null_in_array_and_check():
	for i in range(in_zone_nodes.size() - 1, -1, -1):
		if in_zone_nodes[i]==null:
			in_zone_nodes.remove_at(i)
	check_if_active()

func _is_valid_target(body:Node3D):
	var has_children:Node= find_node_having_the_script_in_source_parent(body, allow_if_have_this_script_as_node)
	if has_children==null:
		return false	
	return true

	
func find_node_having_the_script_in_source_parent(node: Node, script:Script) -> Node:
	if node == null:
		return null
	if node.get_script() == allow_if_have_this_script_as_node:
		return node
	return find_node_having_the_script_in_source_parent(node.get_parent(), script)

func _on_area_entered(area: Area3D) -> void:
	if not _is_valid_target(area):
		return
	var parent:Node= find_node_having_the_script_in_source_parent(area, allow_if_have_this_script_as_node)
	if not in_zone_nodes.has(parent):
		in_zone_nodes.append(parent)
		check_if_active()
		on_node_entering_valide.emit(parent)
		

func _on_area_exited(area: Area3D) -> void:	
	if not _is_valid_target(area):
		return
	var parent:Node= find_node_having_the_script_in_source_parent(area, allow_if_have_this_script_as_node)
	if in_zone_nodes.has(parent):
		in_zone_nodes.erase(parent)	
		check_if_active()
		on_node_exiting_valide.emit(parent)
