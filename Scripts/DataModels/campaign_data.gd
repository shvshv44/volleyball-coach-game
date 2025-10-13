## Here we can have all the data related to the current campign.
extends Resource
class_name CampaignData

@export var current_money: float = 0
@export var current_cep: float = 0
var current_season: CoachingSeason = null
var calendar_data: CalendarData = null

func _init():
	current_money = 0
	current_cep = 0
	init_new_season(2000)
	calendar_data = CalendarData.new(current_season)

func init_new_season(start_year: int) -> void:
	current_season = CoachingSeason.new(start_year)
	
func is_season_active() -> bool:
	return current_season != null && calendar_data.current_day != null

func get_current_month() -> CoachingMonth:
	_validate_campaign_active("Campaign must be active to get a month!")
	return CampaignManager.campaign_data.current_season.get_month(calendar_data.current_day)

func get_current_day() -> CoachingDay:
	_validate_campaign_active("Campaign must be active to get a day!")
	return CampaignManager.campaign_data.current_season.get_day(calendar_data.current_day)

func get_selected_day() -> CoachingDay:
	_validate_campaign_active("Campaign must be active to get a day!")
	return CampaignManager.campaign_data.current_season.get_day(calendar_data.selected_day)
	
func get_shown_month() -> CoachingMonth:
	_validate_campaign_active("Campaign must be active to get a month!")
	return CampaignManager.campaign_data.current_season.get_month_by_num(calendar_data.current_shown_year_num, calendar_data.current_shown_month_num)
	
func _validate_campaign_active(message: String) -> void:
	if not is_season_active():
		push_error(message)
		assert(false)
