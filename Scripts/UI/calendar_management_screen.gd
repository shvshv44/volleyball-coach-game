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
	_connect_events()
	_initialize_calandar_grid()
	
func _initialize_calandar_grid() -> void:
	calendar_grid.columns = 7
	var current_month = CampaignManager.campaign_data.get_current_month()
	set_calendar_of_month(current_month)
	refresh_shown_month()

func set_calendar_of_month(month: CoachingMonth) -> void:
	for child in calendar_grid.get_children():
		child.queue_free()
		
	for day in month.days:
		var day_box: CalendarDayBox = calendar_day_scene.instantiate()
		day_box.set_day_num(day.day.day)
		day_box.set_activity(day.main_activity.activity_type)
		calendar_grid.add_child(day_box)
	refresh_day_data()

func refresh_day_data() -> void:
	var current_day = CampaignManager.campaign_data.current_day
	var selected_day = CampaignManager.campaign_data.selected_day
	var shown_month = CampaignManager.campaign_data.current_shown_month_num
	var shown_year = CampaignManager.campaign_data.current_shown_year_num
	
	for child in calendar_grid.get_children():
		if child is CalendarDayBox:
			var day_box = child as CalendarDayBox
			day_box.set_is_current_day(false)
			day_box.set_is_selected(false)
			if shown_year == current_day.year and shown_month == current_day.month:
				if day_box.day_num == current_day.day:
					day_box.set_is_current_day(true)
			if shown_year == selected_day.year and shown_month == selected_day.month:
				if day_box.day_num == selected_day.day:
					day_box.set_is_selected(true)

func refresh_shown_month() -> void:
	var shown_year_num = CampaignManager.campaign_data.current_shown_year_num
	var shown_month_num = CampaignManager.campaign_data.current_shown_month_num
	var shown_month: CoachingMonth = _get_current_season().get_month_by_num(shown_year_num, shown_month_num)
	var first_month = _get_current_season().get_first_month()
	var last_month = _get_current_season().get_last_month()
	
	current_date_label.text = shown_month.to_pretty_print()
	next_day_btn.visible = not (last_month.year_num == shown_year_num and last_month.month_num == shown_month_num)
	prev_day_btn.visible = not (first_month.year_num == shown_year_num and first_month.month_num == shown_month_num)

func _styling_components() -> void:
	_styling_date_picker_panel()
	_styling_calendar_panel()
	_styling_day_details_panel()
	
func _connect_events() -> void:
	next_day_btn.pressed.connect(_on_show_next_month_button_pressed)
	prev_day_btn.pressed.connect(_on_show_prev_month_button_pressed)
	EventManager.next_month_on_calendar_displayed.connect(_on_show_next_month)
	EventManager.prev_month_on_calendar_displayed.connect(_on_show_prev_month)
	EventManager.player_selected_day.connect(_on_player_selected_day)
	
func _on_show_next_month_button_pressed() -> void:
	EventManager.next_month_on_calendar_displayed.emit()

func _on_show_prev_month_button_pressed() -> void:
	EventManager.prev_month_on_calendar_displayed.emit()
	
func _on_show_next_month() -> void:
	CampaignManager.show_next_month()
	refresh_shown_month()
	set_calendar_of_month(CampaignManager.campaign_data.get_shown_month())
	
func _on_show_prev_month() -> void:
	CampaignManager.show_previous_month()
	refresh_shown_month()
	set_calendar_of_month(CampaignManager.campaign_data.get_shown_month())

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
	
func _get_current_season() -> CoachingSeason:
	return CampaignManager.get_current_season_if_active()
	
func _on_player_selected_day(event) -> void:
	refresh_day_data()
