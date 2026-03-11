extends Node

var manifestation_array = [
	preload("res://Manifestation/RessourceInterraction/burning_bush.tscn"),
	preload("res://Manifestation/RessourceInterraction/dark_sky.tscn"),
	preload("res://Manifestation/RessourceInterraction/fruitful_harvest.tscn"),
	preload("res://Manifestation/RessourceInterraction/megafauna.tscn")
]

const manifestation_button = preload("res://Demo/manifestation_button.tscn")
func _ready() -> void:
	var all_grid = get_node("Control/AllManifestation")
	for man in manifestation_array :
		var button = manifestation_button.instantiate()
		button.manifestation_selected.connect(_on_manifestation_emitted)
		all_grid.add_child(button)


func _on_manifestation_emitted( choosen_button : Button):
	get_node("Control/AllManifestation").remove_child(choosen_button)
	get_node("Control/SelectedManifestation").add_child(choosen_button)
