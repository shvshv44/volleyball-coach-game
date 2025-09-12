# Day.gd
extends Resource
class_name CalendaricDay

static var months = [
	"January","February","March","April","May","June",
	"July","August","September","October","November","December"
]

@export var year: int
@export var month: int
@export var day: int

func _init(y: int = 0, m: int = 0, d: int = 0) -> void:
	year = y
	month = m
	day = d

# --- Conversions ---
func to_unix_time() -> int:
	return Time.get_unix_time_from_datetime_dict({
		"year": year,
		"month": month,
		"day": day,
		"hour": 0,
		"minute": 0,
		"second": 0
	})

static func from_unix_time(t: int) -> CalendaricDay:
	var dict = Time.get_datetime_dict_from_unix_time(t)
	return CalendaricDay.new(dict.year, dict.month, dict.day)

# --- Arithmetic ---
func add_days(days: int) -> CalendaricDay:
	return from_unix_time(to_unix_time() + days * 24 * 3600)

func days_until(other: CalendaricDay) -> int:
	return int((other.to_unix_time() - to_unix_time()) / (24 * 3600))

# --- Comparisons ---
func equals(other: CalendaricDay) -> bool:
	return year == other.year and month == other.month and day == other.day

func is_before(other: CalendaricDay) -> bool:
	return to_unix_time() < other.to_unix_time()

func is_after(other: CalendaricDay) -> bool:
	return to_unix_time() > other.to_unix_time()

# --- Pretty prints ---
func to_iso_string() -> String:
	return "%04d-%02d-%02d" % [year, month, day]

func to_pretty_string() -> String:
	return "%d %s %d" % [day, months[month - 1], year]
