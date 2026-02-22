class_name DarkSky extends Manifestation



func _ready() -> void:
	types = {}
	description.text = "Augment Personal Devastation by 1"

func act():
	if (!check_elements()):
		return
	pay_cost_elements()
	add_element_self(Enums.ElementType.DEVASTATION, 1)
