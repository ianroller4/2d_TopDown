extends TileMap

var state := 0

var layerColor := get_layer_modulate(0)
var fadeColor := Color(layerColor, 0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_layer_enabled(0, true)

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		set_layer_modulate(0, fadeColor)


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		set_layer_modulate(0, layerColor)
