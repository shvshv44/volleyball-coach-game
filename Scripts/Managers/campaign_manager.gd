## This class manage the current campaign activities.
extends Node

var campaign_data: CampaignData = null
	
func _init() -> void:
	campaign_data = CampaignData.new()
	
func get_current_season_if_active() -> CoachingSeason:
	if campaign_data.is_season_active():
		return campaign_data.current_season
	push_error("Trying to access CampaignData with empty current_season variable. Season must be active to use it.")
	assert(false)
	return null
	
func show_next_month() -> void:
	var last_month = get_current_season_if_active().get_last_month()
	if not (last_month.month_num ==  campaign_data.current_shown_month_num and last_month.year_num == campaign_data.current_shown_year_num):
		var new_month = campaign_data.current_shown_month_num + 1
		var new_year = campaign_data.current_shown_year_num
		if new_month > 12:
			new_year = new_year + 1
			new_month = 1
		campaign_data.current_shown_month_num = new_month
		campaign_data.current_shown_year_num = new_year
		
func show_previous_month() -> void:
	var first_month = get_current_season_if_active().get_first_month()
	if not (first_month.month_num ==  campaign_data.current_shown_month_num and first_month.year_num == campaign_data.current_shown_year_num):
		var new_month = campaign_data.current_shown_month_num - 1
		var new_year = campaign_data.current_shown_year_num
		if new_month < 1:
			new_year = new_year - 1
			new_month = 12
		campaign_data.current_shown_month_num = new_month
		campaign_data.current_shown_year_num = new_year

# Should be called when the player wants to end the day
func next_day() -> void:
	var next_day: CalendaricDay = campaign_data.current_day.next_day()
	if get_current_season_if_active().get_last_day().day.is_after(next_day):
		var new_day_event = NextDayStartedEvent.new(campaign_data.current_day, next_day)
		campaign_data.current_day = next_day
		campaign_data.is_after_main_activity = false
		EventManager.next_day_started.emit(new_day_event)
	
# Should be called when the player starts the main acitvity 
func activate_main_activity() -> void:
	if not campaign_data.is_after_main_activity:
		var current_day: CoachingDay = get_current_season_if_active().get_day(campaign_data.current_day)
		if current_day.main_activity != null:
			current_day.main_activity.take_affect()

# Should be called after the main activity is finished or activity is BREAK
func finish_day() -> void:
	campaign_data.is_after_main_activity = true
	EventManager.main_activity_finished.emit()
	
func select_day(_year_num: int, _month_num: int, _day_num: int) -> void:
	var _new_selected_day = CalendaricDay.new(_year_num, _month_num, _day_num)
	campaign_data.selected_day = _new_selected_day
	EventManager.player_selected_day.emit(PlayerSelectedDayEvent.new(_new_selected_day))
	
func select_calendaric_day(_selected: CalendaricDay) -> void:
	self.select_day(_selected.year, _selected.month, _selected.day)

func show_calendaric_day(_selected: CalendaricDay) -> void:
	campaign_data.current_shown_month_num = _selected.month
	campaign_data.current_shown_year_num = _selected.year
	
	
