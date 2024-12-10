extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Zombie.visible = false
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
		call_deferred("_disable_collision")

func _show_zombie():
	$Zombie.visible = true
	$Zombie/CollisionShape3D.disabled = false

func _disable_collision() -> void:
	%CollisionShape3D.disabled = true
