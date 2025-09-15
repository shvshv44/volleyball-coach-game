extends Node

var months = [
	"January","February","March","April","May","June",
	"July","August","September","October","November","December"
]

func month_name_by_number(num: int) -> String:
	if(num >= 1 and num <= months.size()):
		return months[num - 1]
	push_error("%d is not a valid month number!" % num)
	assert(false)
	return ""

func to_unix_time(year: int, month: int, day: int) -> int:
	return Time.get_unix_time_from_datetime_dict({
		"year": year,
		"month": month,
		"day": day,
		"hour": 0,
		"minute": 0,
		"second": 0
	})
