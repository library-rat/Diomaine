class_name Eclipse extends Manifestation



func _ready() -> void:
	types[Enums.ElementType.ABUNDANCE] = 2
	description.text = "Augment Personal Might by 3"

func act():
	if (!check_elements()):
		return
	pay_cost_elements()
	add_element_self(Enums.ElementType.MIGHT, 3)
