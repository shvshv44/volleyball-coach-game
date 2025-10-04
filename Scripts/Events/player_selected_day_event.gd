class_name PlayerSelectedDayEvent extends Event
var selected_day: CalendaricDay

func _init(_selected_day: CalendaricDay):
	selected_day = _selected_day
