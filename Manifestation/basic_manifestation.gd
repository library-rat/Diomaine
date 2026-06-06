@abstract
class_name Manifestation extends Control

var manifestation_name : String
@export var types : Dictionary[Enums.ElementType,int] : set = _set_types
@export var god : God
@export var cooldown : int = 30 #in number of day
@export var description_text :String : set = _set_description_text
@onready var description :RichTextLabel = $Description/RichTextLabel
@onready var panel_cost_lines : Panel = $PanelCostLines

func _set_types(new_dict) ->void:
	types = new_dict
	if(panel_cost_lines):
		panel_cost_lines.set_cost_lines(types)
	

func _set_description_text(new_description):
	description_text = new_description
	description.text = description_text

func act():
	for type in types :
		if check_elements():
			pay_cost_elements()

func _on_button_mouse_entered() -> void:
	$DescriptionTimer.start(0.7)


func _on_button_mouse_exited() -> void:
	$Description.visible = false
	$DescriptionTimer.stop()


func _on_description_timer_timeout() -> void:
	$Description.visible = true

func check_elements() -> bool:
	for type in types :
		if ! god.check_element(type,types[type]):
			return false
	return true

func pay_cost_elements() -> void :
	for type in types :
		god.pay_cost_element(type,types[type])
		
func add_element_self(type : Enums.ElementType, value : int) -> void:
	god.add_element(type, value)

func remove_global_element(type : Enums.ElementType, value : int) -> void:
	god.remove_global_element(type, value)

func multiply_element(type :Enums.ElementType, value : int) -> void :
	god.multiply_element(type,value)
	
func multiply_global_element(type :Enums.ElementType, value : int) -> void :
	god.multiply_global_element(type,value)

func update_panel_cost():
	var asserted_costs = []
	for type in types :
		if ! god.check_element(type,types[type]):
			asserted_costs[type] = false
		else :
			asserted_costs[type] = true
	

func _on_button_button_down() -> void:
	act()
