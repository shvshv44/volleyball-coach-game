## This class manage the current campaign activities.
extends Node

var campaign_data: CampaignData = null
	
func _init() -> void:
	campaign_data = CampaignData.new()
	
func _ready() -> void:
	pass
