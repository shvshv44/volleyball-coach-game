extends Resource
class_name CoachingDay

@export var day: CalendaricDay
@export var main_activity: DailyActivity

func _init(_day: CalendaricDay) -> void:
	day = _day
	main_activity = BreakActivity.new()
	#TODO: add casual events (like player returning from injury)

func set_main_activity(activity: DailyActivity) -> void:
	main_activity = activity
