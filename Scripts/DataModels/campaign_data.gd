## Here we can have all the data related to the current campign.
extends Resource
class_name CampaignData

@export var current_money: float = 0
@export var current_cep: float = 0
var current_season: CoachingSeason = null
var current_day: CalendaricDay = null
var is_after_main_activity: bool = false

## This variables affects which month the player looks on.
## After he go to other page and then come back to the calendar page he will.
## See the same month.
var current_shown_month_num: int = 0
var current_shown_year_num: int = 0

func _init():
	current_money = 0
	current_cep = 0
	init_new_season(2000)
	current_day = current_season.months[0].days[0].day
	current_shown_month_num = current_season.months[0].month_num
	current_shown_year_num = current_season.start_year
	is_after_main_activity = false

func init_new_season(start_year: int) -> void:
	current_season = CoachingSeason.new(start_year)
	
func is_season_active() -> bool:
	return current_season != null && current_day != null

func get_current_month() -> CoachingMonth:
	_validate_campaign_active("Campaign must be active to get a month!")
	return CampaignManager.campaign_data.current_season.get_month(current_day)

func get_current_day() -> CoachingDay:
	_validate_campaign_active("Campaign must be active to get a day!")
	return CampaignManager.campaign_data.current_season.get_day(current_day)
	
func get_shown_month() -> CoachingMonth:
	_validate_campaign_active("Campaign must be active to get a month!")
	return CampaignManager.campaign_data.current_season.get_month_by_num(current_shown_year_num, current_shown_month_num)
	
func _validate_campaign_active(message: String) -> void:
	if not is_season_active():
		push_error(message)
		assert(false)
