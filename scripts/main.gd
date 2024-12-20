extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalVar.reset_variables()
	$Lights.hide()
	$Zombie.visible = false
	GlobalSignal.lights_on.connect(_lights_on)


func _lights_on():
	$Lights.show()
	GlobalSignal.hide_torch.emit()
	if GlobalVar.zombie_trapped == false:
		GlobalSignal.set_narrative.emit(GlobalVar.lights_on_text)
	elif GlobalVar.zombie_trapped == true:
		if GlobalVar.drink_water == false:
			GlobalSignal.set_narrative.emit(GlobalVar.drinking_text)
		elif GlobalVar.ate_fruit == false:
			GlobalSignal.set_narrative.emit(GlobalVar.eating_text)
		else:
			GlobalSignal.set_narrative.emit(GlobalVar.sleeping_text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if GlobalVar.torch_collected == true:
		#$torch.visible == false


func _on_zombie_start_chasing_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		call_deferred("_show_zombie")
		GlobalVar.start_zombie_chase = true
		GlobalSignal.set_achievement.emit(GlobalVar.zombie_sound_text)
		call_deferred("_disable_collision")

func _show_zombie():
	$Zombie.visible = true
	$Zombie/CollisionShape3D.disabled = false
	$Zombie/ZombieSound.play()
	$Zombie/FootDraggingSound.play()

func _disable_collision() -> void:
	%CollisionShape3D.disabled = true


func _on_trap_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		print("player trapped")
		call_deferred("_change_scene")
		
	elif body.is_in_group("zombie"):
		print("zombie trapped")
		GlobalSignal.zombie_trapped.emit()

func _change_scene():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
