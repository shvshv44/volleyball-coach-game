extends Resource
class_name CoachingSeason

# Season are 10 months - from September 1 of year X to the end of June in year X + 1
static var SEASON_START_MONTH: int = 9
static var SEASON_END_MONTH: int = 6 # of the next year

var months: Array[CoachingMonth]

func _init(start_year: int) -> void:
		_init_months(start_year)
		
func _init_months(start_year: int) -> void:
	months = []
	var current_year = start_year
	var current_month = SEASON_START_MONTH
	while current_year == start_year or current_month <= SEASON_END_MONTH:
		var initiated_coaching_month = CoachingMonth.new(current_year, current_month)
		months.append(initiated_coaching_month)
		
		current_month = (current_month + 1) % 13
		if current_month == 0:
			current_year += 1
			current_month = 1
