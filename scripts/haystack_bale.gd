extends Node3D
## A giant round haystack bale placeholder mesh.

## Overall scale multiplier — bump this up to make the bale bigger.
@export var scale_multiplier: float = 4.0:
	set(value):
		scale_multiplier = value
		scale = Vector3.ONE * value


func _ready() -> void:
	scale = Vector3.ONE * scale_multiplier
