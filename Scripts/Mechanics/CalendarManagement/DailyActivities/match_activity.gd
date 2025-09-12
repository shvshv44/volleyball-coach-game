extends DailyActivity
class_name MatchActivity

func _init() -> void:
	super._init(DailyActivityType.Type.Match)

func take_affect(campaign_manager: CampaignManager) -> void:
	# TODO: do actual stuff here like move to the match scene.
	print("Match Time!")
