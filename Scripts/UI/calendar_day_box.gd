@tool
extends Control
class_name CalendarDayBox

@export var day_num: int = 0:
	set = set_day_num
@export var activity_type: DailyActivityType.Type = DailyActivityType.Type.Break:
	set = set_activity
@export var is_current_day: bool = false:
	set = set_is_current_day
@export var is_selected: bool = false:
	set = set_is_selected
	
@onready var day_label: Label = $MarginContainer/DayContainer/DayLabel
@onready var activity_icon: TextureRect = $MarginContainer/ActivityContainer/ActivityIcon
@onready var box_space_fill: ColorRect = $MarginContainer/SpaceFill
@onready var box_border: ColorRect = $BorderFill
@onready var day_button: Button = $DayButton

func _ready():
	_init_button()
	
	update_activity_icon()
	update_day_label()
	update_box_colors()
	

# --- Setters ---
func set_day_num(_day: int) -> void:
	day_num = _day
	update_day_label()

func set_activity(_type: DailyActivityType.Type) -> void:
	activity_type = _type
	update_activity_icon()

func set_is_current_day(_is_current_day: bool) -> void:
	is_current_day = _is_current_day
	update_box_colors()
	
func set_is_selected(_is_selected: bool) -> void:
	is_selected = _is_selected
	update_box_colors()

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

func update_box_colors() -> void:
	if not box_space_fill or not box_border:
		return
	if is_current_day:
		box_space_fill.color = ColorUtils.BRIGHT_UI_PICK_COLOR
	else:
		box_space_fill.color = ColorUtils.BRIGHT_UI_MAIN_COLOR
	if is_selected:
		box_border.color = ColorUtils.BRIGHT_UI_CHOOSE_COLOR
	else:
		box_border.color = ColorUtils.DARK_UI_MAIN_COLOR
		
func player_selected_day():
	if not is_selected:
		var year_num: int = CampaignManager.campaign_data.calendar_data.current_shown_year_num
		var month_num: int = CampaignManager.campaign_data.calendar_data.current_shown_month_num
		CampaignManager.select_day(year_num, month_num, day_num)

func _init_button() -> void:
	day_button.modulate = Color.TRANSPARENT
	day_button.pressed.connect(player_selected_day)
