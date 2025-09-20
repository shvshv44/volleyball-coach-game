@tool
extends Control
class_name CalendarDayBox

# TODO: need to load those dynamically by activity type.
var test_icon_texture: Texture2D = preload("res://Assets/volleyball_8673941.png")

@export var day_num: int = 0:
	set = set_day_num
@export var activity_type: DailyActivityType.Type = DailyActivityType.Type.Break:
	set = set_activity
@export var is_current_day: bool = false:
	set = set_is_current_day
	
@onready var day_label: Label = $MarginContainer/DayContainer/DayLabel
@onready var activity_icon: TextureRect = $MarginContainer/ActivityContainer/ActivityIcon
@onready var box_space_fill: ColorRect = $MarginContainer/SpaceFill
@onready var box_border: ColorRect = $BorderFill

func _ready():
	box_border.color = ColorUtils.DARK_UI_MAIN_COLOR

func set_day_num(_day: int):
	day_num = _day
	day_label.text = str(_day)
	
func set_activity(_type: DailyActivityType.Type):
	activity_type = _type
	if activity_type == DailyActivityType.Type.Break:
		activity_icon.hide()
	else:
		# TODO: put based on the activity
		activity_icon.texture = test_icon_texture
		activity_icon.show()

func set_is_current_day(_is_current_day: bool):
	is_current_day = _is_current_day
	if is_current_day:
		box_space_fill.color = ColorUtils.BRIGHT_UI_PICK_COLOR
	else:
		box_space_fill.color = ColorUtils.BRIGHT_UI_MAIN_COLOR
