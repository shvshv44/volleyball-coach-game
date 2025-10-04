extends Resource
class_name CoachingSeason

# Season are 10 months - from September 1 of year X to the end of June in year X + 1
static var SEASON_START_MONTH: int = 9
static var SEASON_END_MONTH: int = 6 # of the next year

var start_year = 0
var months: Array[CoachingMonth]

func _init(_start_year: int) -> void:
	start_year = _start_year
	_init_months(start_year)
		
func _init_months(_start_year: int) -> void:
	months = []
	var current_year = _start_year
	var current_month = SEASON_START_MONTH
	while current_year == _start_year or current_month <= SEASON_END_MONTH:
		var initiated_coaching_month = CoachingMonth.new(current_year, current_month)
		months.append(initiated_coaching_month)
		
		current_month = (current_month + 1) % 13
		if current_month == 0:
			current_year += 1
			current_month = 1
	
func get_month_by_num(_month_year: int, _month_num: int) -> CoachingMonth:
	for month in months:
		if month.year_num == _month_year and month.month_num == _month_num:
			return month
	
	push_error("CoachingMonth not found for date: %d/%d/%d" % [_month_year, _month_num])
	assert(false)
	return null

func get_month(_calendaric_day: CalendaricDay) -> CoachingMonth:
	return get_month_by_num(_calendaric_day.year, _calendaric_day.month)
	
func get_day(_calendaric_day: CalendaricDay) -> CoachingDay:
	var coaching_month = get_month(_calendaric_day)
	for coaching_day in coaching_month.days:
		if coaching_day.day.day == _calendaric_day.day:
			return coaching_day
	
	push_error("CoachingDay not found for date: %d/%d/%d" % [_calendaric_day.year, _calendaric_day.month, _calendaric_day.day])
	assert(false)
	return null
	
func get_last_month() -> CoachingMonth:
	return months[len(months) - 1]
	
func get_first_month() -> CoachingMonth:
	return months[0]
	
func get_last_day() -> CoachingDay:
	var last_month = get_last_month()
	return last_month.days[len(last_month.days) - 1]
