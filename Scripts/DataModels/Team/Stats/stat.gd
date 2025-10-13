extends Resource
class_name Stat

var value: float

func _init(_initial_value: float):
	value = _initial_value

func add(_addition: float):
	value = value + _addition
	_validate_value()
	
func multiply(_factor: float):
	value = value * _factor
	_validate_value()

func _validate_value() -> void:
	# Abstract method placeholder — subclasses will override it
	pass
