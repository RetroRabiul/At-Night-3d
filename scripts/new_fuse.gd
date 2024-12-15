extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.new_fuse.connect(_new_fuse)

func _new_fuse():
	GlobalVar.new_fuse_collected = true
	GlobalSignal.set_narrative.emit(GlobalVar.new_fuse_text)
	call_deferred("_delete_fuse")
	

func _delete_fuse():
	$CollisionShape3D.disabled = true
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
