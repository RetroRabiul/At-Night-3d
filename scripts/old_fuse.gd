extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.old_fuse.connect(_old_fuse)

func _old_fuse():
	GlobalSignal.set_narrative.emit(GlobalVar.old_fuse_test)
	#call_deferred("_delete_fuse")
	#
#
#func _delete_fuse():
	#$CollisionShape3D.disabled = true
	#visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
