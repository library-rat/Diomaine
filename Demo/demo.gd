extends Node

var manifestation_array = [
	preload("res://Manifestation/RessourceInterraction/burning_bush.tscn"),
	preload("res://Manifestation/RessourceInterraction/dark_sky.tscn"),
	preload("res://Manifestation/RessourceInterraction/fruitful_harvest.tscn"),
	preload("res://Manifestation/RessourceInterraction/megafauna.tscn")
]

const manifestation_button = preload("res://Demo/manifestation_button.tscn")
func _ready() -> void:
	var all_grid = get_node("Control/AllManifestation/AllGrid")
	for man in manifestation_array :
		var button = manifestation_button.instantiate()
		var temp = man.instantiate()
		button.contained_manifestation = temp
		button.add_child(temp)
		temp.visible = false
		#var test = temp.description
		button.text = temp.name
		button.manifestation_selected.connect(_on_manifestation_emitted)
		all_grid.add_child(button)

func _on_manifestation_emitted( chosen_button : Button):
	var label = Label.new()
	var test = chosen_button.contained_manifestation
	label.text = chosen_button.contained_manifestation.description_text
	get_node("Control/AllManifestation/AllGrid").remove_child(chosen_button)
	get_node("Control/SelectedManifestation/SelectedGrid").add_child(chosen_button)
	get_node("Control/SelectedManifestation/SelectedGrid").add_child(label)
