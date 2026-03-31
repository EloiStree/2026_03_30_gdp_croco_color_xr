## When unclip, unparent the given node root
## When clip, find a magnet script to parent to given given node 

class_name CrocoColorMagnetArea3D
extends Area3D


static var in_scene:Array[CrocoColorMagnetArea3D] = []

func _ready() -> void:
	if not in_scene.has(self):
		in_scene.append(self)

func _exit_tree() -> void:
	if in_scene.has(self):
		in_scene.erase(self)



static func is_point_in_the_area(point: Vector3, node:Node3D) -> bool:
	# Iterate through all child CollisionShape3D nodes
	for child in node.get_children():
		if child is CollisionShape3D and child.shape:
			var shape: Shape3D = child.shape
			
			# Transform the point into the local space of the shape
			var local_point = child.global_transform.affine_inverse() * point
			
			if _is_point_inside_shape(shape, local_point):
				return true
	
	return false


static func _is_point_inside_shape(shape: Shape3D, point: Vector3) -> bool:
	match shape:
		BoxShape3D:
			var extents = shape.size * 0.5
			return abs(point.x) <= extents.x \
				and abs(point.y) <= extents.y \
				and abs(point.z) <= extents.z
		
		SphereShape3D:
			return point.length() <= shape.radius
		
		CapsuleShape3D:
			var radius = shape.radius
			var height = shape.height
			
			# Clamp point to capsule line segment
			var half_height = height * 0.5
			var y = clamp(point.y, -half_height, half_height)
			var closest = Vector3(0, y, 0)
			
			return point.distance_to(closest) <= radius
		
		CylinderShape3D:
			var radius = shape.radius
			var height = shape.height * 0.5
			
			return Vector2(point.x, point.z).length() <= radius \
				and abs(point.y) <= height
		
		_:
			# Unsupported shapes (ConvexPolygon, Concave, etc.)
			# You could expand this if you enjoy suffering
			return false




static func find_area_containing_point(point:Vector3)->Array[CrocoColorMagnetArea3D]:
	var result:Array[CrocoColorMagnetArea3D] = []
	for area in in_scene:
		if area.is_point_in_the_area(point, area):
			result.append(area)
	return result
