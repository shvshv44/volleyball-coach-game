extends Node
class_name CampaignManager

# TODO: This class manage the current campaign activities and events.
@export var campaign_data: CampaignData = null
	
func _ready() -> void:
	#TODO: just testing - delete after
	print("Hey")
	var test_season = CoachingSeason.new(2000)
	for month_variant in test_season.months:
		var month: CoachingMonth = month_variant
		for day_variant in month.days:
			var day: CoachingDay = day_variant
			print(day.day.to_pretty_string())
