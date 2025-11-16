extends ElementManager


@onready var timeCursor : Node = $Border/Cursor
@onready var wheelBorder : Node = $Border

@export var globalRessources : GlobalRessources
@export var radiusFactor :float = 1.4 *0.5
var mDay : int = 1 #current day in the month first is 1
var yDay : int = 1 #current day in the year first is 1
var maxDay : int = 360 
var currentMonth : int = 0 #current month in the array (First month is 0)


var timeCounter : float = 0
@export var longDayDuration : float = 0.25
@export var shortDayDuration : float = 0.05
var currentDayDuration : float = longDayDuration

@export var Months : Array[BaseMonth]
#@onready var Season : Array[BaseSeason] = [Spring.new(),Summer.new(),Autumn.new(),Winter.new()]
#
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxDay = 0
	for i in range(Months.size()):
		maxDay += Months[i].duration;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if currentDayDuration < 0 :
		return
	timeCounter += delta

	if timeCounter >= currentDayDuration :
		timeCounter = 0.
		_on_new_day()


func _on_new_day() -> void:
	mDay =  mDay +1
	yDay = yDay +1
	if (Months[currentMonth].duration < mDay) :
		currentMonth = (currentMonth +1) % Months.size();
		mDay = 1
	if(yDay > maxDay) :
		yDay = 1
	update_cursor_position()
	globalRessources.set_elements(Months[currentMonth].getElements())


func update_cursor_position() ->void:
	var currentAngle = float(yDay)/maxDay * 2*PI
	timeCursor.position.x = wheelBorder.texture.get_size().x/2 - timeCursor.texture.get_size().x/2 +wheelBorder.texture.get_size().x * -sin(currentAngle) * radiusFactor
	timeCursor.position.y = wheelBorder.texture.get_size().y/2 - timeCursor.texture.get_size().y/2 +wheelBorder.texture.get_size().y * -cos(currentAngle) * radiusFactor
	timeCursor.rotation = -currentAngle

func setSpeedFast() -> void:
	currentDayDuration = shortDayDuration
func setSpeedPlay() -> void :
	currentDayDuration = longDayDuration
func setSpeedStop() -> void :
	currentDayDuration = -1
