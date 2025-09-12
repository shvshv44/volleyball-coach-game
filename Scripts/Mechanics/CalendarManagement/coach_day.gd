extends Resource
class_name CoachDay

@export var day: CalendaricDay
@export var main_activity: DailyActivity

func _init(day: CalendaricDay) -> void:
	day = day
	main_activity = BreakActivity.new()
