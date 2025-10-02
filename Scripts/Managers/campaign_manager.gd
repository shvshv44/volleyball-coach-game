## This class manage the current campaign activities.
extends Node

var campaign_data: CampaignData = null
	
func _init() -> void:
	campaign_data = CampaignData.new()
	
func get_current_season_if_active():
	if campaign_data.is_season_active():
		return campaign_data.current_season
	push_error("Trying to access CampaignData with empty current_season variable. Season must be active to use it.")
	assert(false)
	
func show_next_month():
	var last_month = get_current_season_if_active().get_last_month()
	if not (last_month.month_num ==  campaign_data.current_shown_month_num and last_month.year_num == campaign_data.current_shown_year_num):
		var new_month = campaign_data.current_shown_month_num + 1
		var new_year = campaign_data.current_shown_year_num
		if new_month > 12:
			new_year = new_year + 1
			new_month = 1
		campaign_data.current_shown_month_num = new_month
		campaign_data.current_shown_year_num = new_year
		
func show_previous_month():
	var first_month = get_current_season_if_active().get_first_month()
	if not (first_month.month_num ==  campaign_data.current_shown_month_num and first_month.year_num == campaign_data.current_shown_year_num):
		var new_month = campaign_data.current_shown_month_num - 1
		var new_year = campaign_data.current_shown_year_num
		if new_month < 1:
			new_year = new_year - 1
			new_month = 12
		campaign_data.current_shown_month_num = new_month
		campaign_data.current_shown_year_num = new_year
	
	
