extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.key.connect(_ket_collected)


func _ket_collected() -> void:
	GlobalVar.ket_collected = true
	GlobalSignal.set_narrative.emit(GlobalVar.ket_text)
	print("got the key")
	call_deferred("_delete_key")
	

func _delete_key():
	$CollisionShape3D.disabled = true
	visible = false
	
