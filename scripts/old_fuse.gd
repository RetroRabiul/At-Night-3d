extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$old.show()
	$new.hide()
	GlobalSignal.old_fuse.connect(_old_fuse)

func _old_fuse():
	if GlobalVar.new_fuse_collected:
		$old.hide()
		$new.show()
		GlobalVar.lights_on = true
		GlobalSignal.lights_on.emit()
	else:
		GlobalSignal.set_narrative.emit(GlobalVar.old_fuse_text)
	#call_deferred("_delete_fuse")
	#
#
#func _delete_fuse():
	#$CollisionShape3D.disabled = true
	#visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
