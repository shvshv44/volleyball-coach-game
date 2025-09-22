extends Node

const BUTTONS_MANAGE_TEAM: Texture2D = preload("res://Assets/Buttons/cog_team.png")
const BUTTONS_MANAGE_SKILLS: Texture2D = preload("res://Assets/Buttons/skill_graph.png")
const BUTTONS_MARKET: Texture2D = preload("res://Assets/Buttons/market.png")
const BUTTONS_MESSAGES: Texture2D = preload("res://Assets/Buttons/phone.png")

const ICONS_MONEY: Texture2D = preload("res://Assets/Buttons/png-clipart-coins-coins.png")
const ICONS_CEP: Texture2D = preload("res://Assets/Buttons/Arrow-up-1-icon.png")

const ACTIVITY_TRAINING: Texture2D = preload("res://Assets/Activities/training.png")
const ACTIVITY_MATCH: Texture2D = preload("res://Assets/Activities/volleyball-game.jpg")
const ACTIVITY_RANDOM: Texture2D = preload("res://Assets/Activities/random_activity.png")


const ACTIVITY_ICON_MAP: Dictionary = {
	DailyActivityType.Type.Training: ACTIVITY_TRAINING,
	DailyActivityType.Type.Match: ACTIVITY_MATCH,
	DailyActivityType.Type.SpecialOccasion: ACTIVITY_RANDOM,
}
