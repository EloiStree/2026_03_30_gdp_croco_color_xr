class_name CrocoColorSetUniqueMeshAlbedo
extends Node

@export var to_affect: Array[MeshInstance3D]
@export var material_to_duplicate_at_ready: StandardMaterial3D

var was_setup:=false

func _setup():
	for mesh in to_affect:
		_duplicate_material(mesh)
	was_setup=true

func _ready() -> void:
	if not was_setup:
		_setup()
	

func _duplicate_material(mesh: MeshInstance3D):
	var mat: StandardMaterial3D = material_to_duplicate_at_ready.duplicate(true)
	mesh.set_surface_override_material(0, mat)

func _set_material_color_of_mesh(mesh: MeshInstance3D, new_color: Color) -> void:
	var mat = mesh.get_surface_override_material(0)
	if mat == null and mesh.mesh:
		mat = mesh.mesh.surface_get_material(0)
	
	if mat and mat is StandardMaterial3D:
		mat.albedo_color = new_color
		mesh.set_surface_override_material(0, mat)
	else:
		print("Mesh ", mesh.name, " has no StandardMaterial3D for coloring")

func set_color(color: Color) -> void:
	if not was_setup:
		_setup()
	for mesh in to_affect:
		_set_material_color_of_mesh(mesh, color)
