extends Resource
class_name CoachingMonth

@export var year_num: int
@export var month_num: int
@export var days: Array[CoachingDay]

func _init(year: int, month: int) -> void:
	month_num = month
	year_num = year
	_init_days(year, month)

func get_day(day_num: int) -> CoachingDay:
	if(day_num >= 1 and day_num <= days.size()):
		return days[day_num]
	push_error("%d is not a valid day number in month!" % day_num)
	assert(false)  # stops execution
	return null  # just for type safety
	
func _init_days(year: int, month: int) -> void:
	days = []
	var current_day = CalendaricDay.new(year_num, month_num, 1)
	while current_day.month == month_num:
		var initiated_coaching_day = CoachingDay.new(current_day)
		days.append(initiated_coaching_day)
		current_day = current_day.next_day()
