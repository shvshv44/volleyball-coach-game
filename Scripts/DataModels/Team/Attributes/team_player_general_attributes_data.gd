extends Resource
class_name TeamPlayerGeneralAttributesData

var name: String = "No Name Assigned"
var number: int = 0
var hight: float = 1.0 # Calculated in meters
var wisdom: float = 0
var mentality: PlayerMentality.Type = PlayerMentality.Type.Winning
var personality: PlayerPersonality.Type = PlayerPersonality.Type.Charismatic


func _init():
	pass # TODO
