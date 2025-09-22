@tool
extends Control
class_name CalendarDayBox

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
	# Safe initialization after nodes exist
	update_activity_icon()
	update_day_label()
	update_current_day_color()

# --- Setters ---
func set_day_num(_day: int) -> void:
	day_num = _day
	update_day_label()

func set_activity(_type: DailyActivityType.Type) -> void:
	activity_type = _type
	update_activity_icon()

func set_is_current_day(_is_current_day: bool) -> void:
	is_current_day = _is_current_day
	update_current_day_color()

# --- Internal update methods ---
func update_day_label() -> void:
	if day_label:
		day_label.text = str(day_num)

func update_activity_icon() -> void:
	if not activity_icon:
		return # Node not ready yet
	if activity_type == DailyActivityType.Type.Break:
		activity_icon.hide()
	else:
		# Safe editor/runtime assignment
		if Icons.ACTIVITY_ICON_MAP.has(activity_type):
			activity_icon.texture = Icons.ACTIVITY_ICON_MAP[activity_type]
		else:
			activity_icon.texture = null
		activity_icon.show()

func update_current_day_color() -> void:
	if not box_space_fill:
		return
	if is_current_day:
		box_space_fill.color = ColorUtils.BRIGHT_UI_PICK_COLOR
	else:
		box_space_fill.color = ColorUtils.BRIGHT_UI_MAIN_COLOR
