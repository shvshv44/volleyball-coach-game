extends Resource
class_name CalendarData

var current_day: CalendaricDay = null
var selected_day: CalendaricDay = null
var is_after_main_activity: bool = false
## This variables affects which month the player looks on.
## After he go to other page and then come back to the calendar page he will.
## See the same month.
var current_shown_month_num: int = 0
var current_shown_year_num: int = 0

func _init(season: CoachingSeason):
	current_day = season.get_first_day().day
	selected_day = season.get_first_day().day
	current_shown_month_num = season.get_first_month().month_num
	current_shown_year_num = season.start_year
	is_after_main_activity = false
