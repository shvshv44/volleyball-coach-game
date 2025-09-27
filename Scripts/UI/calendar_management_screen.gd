extends Control
class_name CalendarManagementScreen

# Date Picker
@onready var date_picker_panel: Panel = $UI/VBoxContainer/ScreenContainer/DatePickerPanel
@onready var current_date_label: Label = $UI/VBoxContainer/ScreenContainer/DatePickerPanel/DatePickerContainer/CenterContainer/CurrentDate
@onready var prev_day_btn: TextureButton = $UI/VBoxContainer/ScreenContainer/DatePickerPanel/DatePickerContainer/PrevMonthBtn
@onready var next_day_btn: TextureButton = $UI/VBoxContainer/ScreenContainer/DatePickerPanel/DatePickerContainer/NextMonthBtn

# Calendar
@onready var calendar_panel: PanelContainer = $UI/VBoxContainer/ScreenContainer/DetailsContainer/CalendarPanel
@onready var calendar_grid: GridContainer = $UI/VBoxContainer/ScreenContainer/DetailsContainer/CalendarPanel/MarginContainer/CalendarContainer

# Day Details
@onready var day_details_panel: PanelContainer = $UI/VBoxContainer/ScreenContainer/DetailsContainer/DayDetailsPanel

var calendar_day_scene = preload("res://Scenes/UI/calendar_day_box.tscn")

func _ready():
	_styling_components()
	_initialize_calandar_grid()
	
func _initialize_calandar_grid() -> void:
	calendar_grid.columns = 7
	var current_month = CampaignManager.campaign_data.get_current_month()
	set_calendar_of_month(current_month)
		
func set_calendar_of_month(month: CoachingMonth) -> void:
	for child in calendar_grid.get_children():
		child.queue_free()
		
	for day in month.days:
		var day_box: CalendarDayBox = calendar_day_scene.instantiate()
		day_box.set_day_num(day.day.day)
		day_box.set_activity(day.main_activity.activity_type)
		calendar_grid.add_child(day_box)
	refresh_current_day()
		
func refresh_current_day() -> void:
	var current_day = CampaignManager.campaign_data.current_day
	var shown_month = CampaignManager.campaign_data.current_shown_month_num
	var shown_year = CampaignManager.campaign_data.current_shown_year_num
	
	for child in calendar_grid.get_children():
		if child is CalendarDayBox:
			var day_box = child as CalendarDayBox
			day_box.set_is_current_day(false)
			if shown_year == current_day.year and shown_month == current_day.month:
				if day_box.day_num == current_day.day:
					day_box.set_is_current_day(true)

func _styling_components() -> void:
	_styling_date_picker_panel()
	_styling_calendar_panel()
	_styling_day_details_panel()

func _styling_date_picker_panel() -> void:
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = ColorUtils.MEDIUM_UI_MAIN_COLOR
	stylebox.border_color = ColorUtils.DARK_UI_MAIN_COLOR
	stylebox.border_width_left = 10
	stylebox.border_width_right = 10
	stylebox.border_width_top = 5
	stylebox.border_width_bottom = 10
	date_picker_panel.add_theme_stylebox_override("panel", stylebox)

func _styling_calendar_panel() -> void:
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = ColorUtils.MEDIUM_UI_MAIN_COLOR
	stylebox.border_color = ColorUtils.DARK_UI_MAIN_COLOR
	stylebox.border_width_left = 10
	stylebox.border_width_right = 5
	stylebox.border_width_top = 5
	stylebox.border_width_bottom = 10
	calendar_panel.add_theme_stylebox_override("panel", stylebox)
	
func _styling_day_details_panel() -> void:
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = ColorUtils.MEDIUM_UI_MAIN_COLOR
	stylebox.border_color = ColorUtils.DARK_UI_MAIN_COLOR
	stylebox.border_width_left = 5
	stylebox.border_width_right = 10
	stylebox.border_width_top = 5
	stylebox.border_width_bottom = 10
	day_details_panel.add_theme_stylebox_override("panel", stylebox)
