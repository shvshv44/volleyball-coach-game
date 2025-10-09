extends DailyActivity
class_name MatchActivity

func _init() -> void:
	super._init(DailyActivityType.Type.Match)

func take_affect() -> void:
	# TODO: do actual stuff here like move to the match scene.
	print("Match Time!")
	CampaignManager.finish_day()
