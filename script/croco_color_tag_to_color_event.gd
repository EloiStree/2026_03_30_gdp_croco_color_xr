
class_name CrocoColorTagToColorEvent
extends Node

signal on_color_found(color:Color)

func push_in_node_holding_color(node:Node):
	var tag_color= find_microbit_interactive_source(node, CrocoColorSetterTagRgb)
	if tag_color is CrocoColorSetterTagRgb:
		var tagRgb : CrocoColorSetterTagRgb= tag_color
		if tagRgb:
			var color = tagRgb.color_resource.color
			on_color_found.emit(color)
	
func find_microbit_interactive_source(node: Node, script:Script) -> Node:
	if node.get_script() == script:
		return node		
	for child in node.get_children():
		var result = find_microbit_interactive_source(child,script)
		if result:
			return result
	return null
	
