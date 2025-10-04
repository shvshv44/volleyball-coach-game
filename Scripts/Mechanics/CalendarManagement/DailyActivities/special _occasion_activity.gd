extends DailyActivity
class_name SpecialOccasionActivity

func _init() -> void:
	super._init(DailyActivityType.Type.SpecialOccasion)

func take_affect() -> void:
	# TODO: Need to implement - can be many types (need to be generic) - see the docs for more info.
	print("Special Occasion!")
