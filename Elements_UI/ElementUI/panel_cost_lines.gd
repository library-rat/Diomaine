extends Panel
var cost_line = preload("res://Elements_UI/ElementUI/cost_line.tscn")


func set_cost_lines(line_dico : Dictionary[Enums.ElementType,int]) :
	for child in $VBoxContainer.get_children():
		child.free()
	for element in line_dico.keys() :
		var new_line = cost_line.instantiate()
		$VBoxContainer.add_child(new_line)
		new_line.set_cost(line_dico[element], element)
	resize()

func resize():
	
	var cost_line_num = $VBoxContainer.get_children().size()
	if(cost_line_num):
		size.y = 0
	size.y = 20 + cost_line_num*15
	position.y = -20 - cost_line_num*15
