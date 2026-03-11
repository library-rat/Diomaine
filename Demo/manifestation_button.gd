extends Button
signal manifestation_selected(button)

var contained_manifestation : Manifestation

func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
	manifestation_selected.emit(self)
