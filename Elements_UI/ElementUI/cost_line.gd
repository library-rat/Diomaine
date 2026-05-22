extends HBoxContainer

@onready var name_label = $Name

#Function called when updating a cost line should set value, name and image
func set_cost(value : int ,element : Enums.ElementType):
	$Cost.text = str(value)
	match element :
		Enums.ElementType.ABUNDANCE:
			name_label.text = "Abundance"
		Enums.ElementType.DEVASTATION :
			name_label.text = "Devastation"
		Enums.ElementType.MALICE:
			name_label.text = "Malice"
		Enums.ElementType.MIGHT:
			name_label.text = "Might"
