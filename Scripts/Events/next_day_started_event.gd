class_name NextDayStartedEvent extends Event
var prev_day: CalendaricDay
var new_day: CalendaricDay

func _init(_prev_day: CalendaricDay, _new_day: CalendaricDay):
	prev_day = _prev_day
	new_day = _new_day
