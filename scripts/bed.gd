extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.sleep.connect(_sleep)

func _sleep():
	if GlobalVar.drink_water == false:
		GlobalSignal.set_narrative.emit(GlobalVar.drinking_text)
	elif GlobalVar.ate_fruit == false:
		GlobalSignal.set_narrative.emit(GlobalVar.eating_text)
	elif GlobalVar.lights_on == false:
		GlobalSignal.set_narrative.emit(GlobalVar.search_fusebox)
	elif GlobalVar.zombie_trapped == false:
		GlobalSignal.set_narrative.emit(GlobalVar.lights_on_text)
	else:
		print("player is sleeping")
		get_tree().change_scene_to_file("res://scenes/survived.tscn")
	#if GlobalVar.drink_water == false:
		#GlobalSignal.set_narrative.emit(GlobalVar.drinking_text)
	
# Called eve"ry frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
