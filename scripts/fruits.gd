extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.eat.connect(_eaten)

func _eaten():
	if GlobalVar.drink_water:
		GlobalVar.ate_fruit = true
		print(GlobalVar.ate_fruit)
		$RedApple.visible = false
		GlobalSignal.set_narrative.emit(GlobalVar.search_fusebox)
	else:
		GlobalSignal.set_narrative.emit(GlobalVar.drinking_text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
