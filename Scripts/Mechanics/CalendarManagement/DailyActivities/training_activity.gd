extends DailyActivity
class_name TrainingActivity

func _init() -> void:
	super._init(DailyActivityType.Type.Training)

func take_affect() -> void:
	# TODO: do actual stuff here like move to the training scene.
	print("Training Time!")
	CampaignManager.finish_day()
