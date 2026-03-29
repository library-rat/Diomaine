class_name Megafauna extends Manifestation



func _ready() -> void:
	manifestation_name = "Megafauna"
	types[Enums.ElementType.ABUNDANCE] = 2
	cooldown = 90
	description_text = "Augment Personal Might by 3"

func act():
	if (!check_elements()):
		return
	pay_cost_elements()
	add_element_self(Enums.ElementType.MIGHT, 3)
