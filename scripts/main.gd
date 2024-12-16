extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Lights.hide()
	$Zombie.visible = false
	GlobalSignal.lights_on.connect(_lights_on)


func _lights_on():
	$Lights.show()
	GlobalSignal.hide_torch.emit()
	GlobalSignal.set_narrative.emit(GlobalVar.lights_on_text)


	#GlobalSignal.torch_collected.connect(_torch_collected)
#
#func _torch_collected() -> void:
	#print("got the torch")
	#call_deferred("_delete_torch")
	#
	#
#func _delete_torch():
	#$torch.queue_free()

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
