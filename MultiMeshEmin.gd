tool
extends MultiMeshInstance

func _ready():
	var mm = MultiMesh.new()
	mm.color_format = MultiMesh.COLOR_FLOAT
	mm.transform_format = MultiMesh.TRANSFORM_3D
	multimesh = mm
