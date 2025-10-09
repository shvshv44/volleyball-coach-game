extends Control
class_name MainManagmentBar

# TODO: make it initialize the buttons via code - make it more dynamic!
@onready var _manage_team_button: TextureButton = $MarginContainer/HBoxContainer/ManagementButtons/ManageTeamButtonContainer/ManageTeamButton
@onready var _skill_tree_button: TextureButton = $MarginContainer/HBoxContainer/ManagementButtons/SkillTreeButtonContainer/SkillTreeButton
@onready var _market_button: TextureButton = $MarginContainer/HBoxContainer/ManagementButtons/MarketButtonContainer/MarketButton
@onready var _messages_button: TextureButton = $MarginContainer/HBoxContainer/ManagementButtons/MessagesButtonContainer/MessagesButton

@onready var _border_fill: ColorRect = $BorderFill
@onready var _space_fill: ColorRect = $MarginContainer/SpaceFill

func _ready() -> void:
	_border_fill.color = ColorUtils.DARK_UI_MAIN_COLOR
	_space_fill.color = ColorUtils.MEDIUM_UI_MAIN_COLOR
	
	# TODO: make it initialize the buttons via code - make it more dynamic!
	_manage_team_button.pressed.connect(_on_manage_team_button_pressed)
	_skill_tree_button.pressed.connect(_on_skill_tree_button_pressed)
	_market_button.pressed.connect(_on_market_button_pressed)
	_messages_button.pressed.connect(_on_messages_button_pressed)
	
func _on_manage_team_button_pressed():
	print("Go To Manage Team Sceen!")
	
func _on_skill_tree_button_pressed():
	print("Go To Skill Tree Sceen!")
	
func _on_market_button_pressed():
	print("Go To Market Sceen!")
	
func _on_messages_button_pressed():
	print("Go To Messages Sceen!")
