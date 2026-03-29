class_name FruitfulHarvest extends Manifestation



func _ready() -> void:
	manifestation_name = "Fruitful Harvest"
	types = {}
	description_text = "Augment Personal Abundance by 1"

func act():
	if (!check_elements()):
		return
	pay_cost_elements()
	add_element_self(Enums.ElementType.ABUNDANCE, 1)
