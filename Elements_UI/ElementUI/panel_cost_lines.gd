extends Panel
var cost_line = preload("res://Elements_UI/ElementUI/cost_line.tscn")
var cost_lines_array = [null, null, null, null]

func set_cost_lines(line_dico : Dictionary[Enums.ElementType,int]) :
	for child in $VBoxContainer.get_children():
		child.free()
	for element in line_dico.keys() :
		var new_line = cost_line.instantiate()
		$VBoxContainer.add_child(new_line)
		new_line.set_cost(line_dico[element], element)
		cost_lines_array[element] = new_line
	resize()

func resize():
	var cost_line_num = $VBoxContainer.get_children().size()
	if(cost_line_num):
		size.y = 0
	size.y = 20 + cost_line_num*15
	position.y = -20 - cost_line_num*15

func color_cost_lines(new_colors :Array[Color]):
	for element in Enums.ElementType.values() :
		if (cost_lines_array[element]):
			cost_lines_array[element].set_color(new_colors[element])

				
