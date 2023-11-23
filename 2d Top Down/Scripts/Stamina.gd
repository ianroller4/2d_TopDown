extends ProgressBar

var barOwner

# Called when the node enters the scene tree for the first time.
func _ready():
	barOwner = get_parent()
	max_value = barOwner.getMaxStamina()
	value = max_value

func _on_player_stamina_change():
	value = barOwner.getStamina() / max_value * 100
