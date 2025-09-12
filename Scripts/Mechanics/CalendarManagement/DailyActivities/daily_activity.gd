extends Resource
class_name DailyActivity

var activity_type: DailyActivityType.Type

func _init(_activity_type: DailyActivityType.Type) -> void:
	self.activity_type = _activity_type

func take_affect(campaign_manager: CampaignManager) -> void:
	push_error("take_affect() must be overridden in a subclass of DailyActivity")
