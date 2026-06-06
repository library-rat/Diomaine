extends ElementManager

class_name GlobalRessources

@onready var gods : Array[God] = [$HBoxContainer/BasicGod,$HBoxContainer/BasicGod2]

@onready var stopButton : Button = $HBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/StopButton
@onready var playButton : Button = $HBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/PlayButton
@onready var fastButton : Button = $HBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/FastButton

@onready var SeasonWheel : Control = $HBoxContainer/VBoxContainer2/season_wheel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	elements_label.insert(Enums.ElementType.ABUNDANCE,$HBoxContainer/VBoxContainer2/VBoxContainer/Abundance/Label)
	elements_label.insert(Enums.ElementType.DEVASTATION,$HBoxContainer/VBoxContainer2/VBoxContainer/Devastation/Label)
	elements_label.insert(Enums.ElementType.MALICE,$HBoxContainer/VBoxContainer2/VBoxContainer/Malice/Label)
	elements_label.insert(Enums.ElementType.MIGHT,$HBoxContainer/VBoxContainer2/VBoxContainer/Might/Label)
	devotion_label = $HBoxContainer/VBoxContainer2/VBoxContainer/Devotion

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _set_devotion(value : int) -> void :
	devotion = value
	update_values()
	if (devotion == 0):
		print("GAME OVER")

func _on_stop_button_pressed() -> void:
	SeasonWheel.setSpeedStop()
	stopButton.disabled = true
	playButton.disabled = false
	fastButton.disabled = false

func _on_play_button_pressed() -> void:
	SeasonWheel.setSpeedPlay()
	stopButton.disabled = false
	playButton.disabled = true
	fastButton.disabled = false

func _on_fast_button_pressed() -> void:
	SeasonWheel.setSpeedFast()
	stopButton.disabled = false
	playButton.disabled = false
	fastButton.disabled = true
