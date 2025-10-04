extends DailyActivity
class_name BreakActivity

func _init() -> void:
	super._init(DailyActivityType.Type.Break)

func take_affect() -> void:
	# TODO: do actual stuff here like heal the fatigue of the all the team's players.
	print("The whole team takes a break!")
