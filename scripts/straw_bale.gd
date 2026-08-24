extends MultiMeshInstance3D
## Bundles many straw meshes into one draw call to represent a giant haystack bale.

@export var straw_mesh: Mesh
@export var straw_count: int = 1_000_000
@export var bale_radius: float = 2.0
@export var bale_height: float = 1.2


func _ready() -> void:
	_generate_bale()


func _generate_bale() -> void:
	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = straw_mesh
	mm.instance_count = straw_count

	var rng := RandomNumberGenerator.new()
	rng.randomize()

	# Build the transform buffer directly — far faster than calling
	# set_instance_transform() a million times.
	var buffer := PackedFloat32Array()
	buffer.resize(straw_count * 12)

	for i in straw_count:
		# Uniform random point inside the bale's circular footprint.
		var angle := rng.randf_range(0.0, TAU)
		var r := sqrt(rng.randf()) * bale_radius
		var x := cos(angle) * r
		var z := sin(angle) * r
		var y := rng.randf_range(0.0, bale_height)

		var tilt := rng.randf_range(-0.35, 0.35)
		var yaw := rng.randf_range(0.0, TAU)
		var length_scale := rng.randf_range(0.8, 1.2)

		var basis := Basis(Vector3.RIGHT, tilt) * Basis(Vector3.UP, yaw)
		basis = basis.scaled(Vector3(1.0, length_scale, 1.0))

		var xform := Transform3D(basis, Vector3(x, y, z))

		var idx := i * 12
		buffer[idx + 0] = xform.basis.x.x
		buffer[idx + 1] = xform.basis.y.x
		buffer[idx + 2] = xform.basis.z.x
		buffer[idx + 3] = xform.origin.x
		buffer[idx + 4] = xform.basis.x.y
		buffer[idx + 5] = xform.basis.y.y
		buffer[idx + 6] = xform.basis.z.y
		buffer[idx + 7] = xform.origin.y
		buffer[idx + 8] = xform.basis.x.z
		buffer[idx + 9] = xform.basis.y.z
		buffer[idx + 10] = xform.basis.z.z
		buffer[idx + 11] = xform.origin.z

	mm.buffer = buffer
	multimesh = mm
