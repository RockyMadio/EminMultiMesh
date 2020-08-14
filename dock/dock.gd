tool
extends Control

var mesh_array = []
var selected_node = null
var selected_mesh_node = null
var counter_index = 0
var meshInstance = null
var btn_mesh = preload("btn_mesh.tscn")
var ec
var clickAdd : bool = false
var clickRem : bool = false

func _on_new_btn_pressed():
	print("plugin added into scene")
	set_physics_process(true)

func _on_Add_mesh_pressed():
	$FileDialog.show()
	
func _on_Remove_mesh_pressed():
	if selected_node != null:
		remove_mesh_to_gui(selected_node)

func SelectIndexUpdate(node_selected,mesh_node_selected):
	selected_node = node_selected
	selected_mesh_node = mesh_node_selected

func add_mesh_to_gui(meshGui):
	$MeshContainer.add_child(meshGui)
	mesh_array.append(meshInstance)
	counter_index+=1
	
func remove_mesh_to_gui(node):
	$MeshContainer.remove_child(node)
	mesh_array.erase(selected_mesh_node)
	selected_mesh_node = null
	selected_node = null
	counter_index-=1

func _on_FileDialog_file_selected(path):
	meshInstance = load(path)
	var btn_mesh_ins = btn_mesh.instance()
	if meshInstance != null:
		btn_mesh_ins.name_mesh = "prova mesh " + str(counter_index)
		btn_mesh_ins.idx = counter_index
		btn_mesh_ins.mesh_node = meshInstance
		btn_mesh_ins.connect("selectedIndex",self,"SelectIndexUpdate")
		add_mesh_to_gui(btn_mesh_ins)
		meshInstance = null
	else:
		print("No mesh selected")