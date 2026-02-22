class_name FruitfulHarvest extends Manifestation



func _ready() -> void:
	types = {}
	description.text = "Augment Personal Abundance by 1"

func act():
	if (!check_elements()):
		return
	pay_cost_elements()
	add_element_self(Enums.ElementType.ABUNDANCE, 1)
