extends Control
class_name CalendarManagementScreen

# Date Picker
@onready var date_picker_panel: Panel = $UI/VBoxContainer/ScreenContainer/DatePickerPanel
@onready var current_date_label: Label = $UI/VBoxContainer/ScreenContainer/DatePickerPanel/DatePickerContainer/CenterContainer/CurrentDate
@onready var prev_day_btn: TextureButton = $UI/VBoxContainer/ScreenContainer/DatePickerPanel/DatePickerContainer/PrevMonthBtn
@onready var next_day_btn: TextureButton = $UI/VBoxContainer/ScreenContainer/DatePickerPanel/DatePickerContainer/NextMonthBtn

# Calendar
@onready var calendar_panel: PanelContainer = $UI/VBoxContainer/ScreenContainer/DetailsContainer/CalendarContainer

# Day Details
@onready var day_details_panel: PanelContainer = $UI/VBoxContainer/ScreenContainer/DetailsContainer/DayDetailsContainer

func _ready():
	_styling_date_picker_panel()
	_styling_calendar_panel()
	_styling_day_details_panel()

func _styling_date_picker_panel():
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = ColorUtils.MEDIUM_UI_MAIN_COLOR
	stylebox.border_color = ColorUtils.DARK_UI_MAIN_COLOR
	stylebox.border_width_left = 10
	stylebox.border_width_right = 10
	stylebox.border_width_top = 5
	stylebox.border_width_bottom = 10
	date_picker_panel.add_theme_stylebox_override("panel", stylebox)

func _styling_calendar_panel():
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = ColorUtils.MEDIUM_UI_MAIN_COLOR
	stylebox.border_color = ColorUtils.DARK_UI_MAIN_COLOR
	stylebox.border_width_left = 10
	stylebox.border_width_right = 5
	stylebox.border_width_top = 5
	stylebox.border_width_bottom = 10
	calendar_panel.add_theme_stylebox_override("panel", stylebox)
	
func _styling_day_details_panel():
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = ColorUtils.MEDIUM_UI_MAIN_COLOR
	stylebox.border_color = ColorUtils.DARK_UI_MAIN_COLOR
	stylebox.border_width_left = 5
	stylebox.border_width_right = 10
	stylebox.border_width_top = 5
	stylebox.border_width_bottom = 10
	day_details_panel.add_theme_stylebox_override("panel", stylebox)
