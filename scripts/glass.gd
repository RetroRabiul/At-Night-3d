extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.drink.connect(_drink)

func _drink():
	GlobalVar.drink_water = true
	print(GlobalVar.drink_water)
	GlobalSignal.set_narrative.emit(GlobalVar.eating_text)
	$water.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
