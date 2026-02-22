class_name BurningBush extends Manifestation



func _ready() -> void:
	types = {}
	description.text = "Augment Personal Malice by 1"

func act():
	if (!check_elements()):
		return
	pay_cost_elements()
	add_element_self(Enums.ElementType.MALICE, 1)
