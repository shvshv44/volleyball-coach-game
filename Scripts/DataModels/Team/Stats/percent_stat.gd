extends Stat
class_name PercentStat

func _validate_value() -> void:
	# Ensure value stays between 0–1
	value = clamp(value, 0.0, 1.0)
