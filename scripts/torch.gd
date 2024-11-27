extends StaticBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.torch_collected.connect(_torch_collected)


func _torch_collected() -> void:
	print("got the torch")
	call_deferred("_delete_torch")
	

func _delete_torch():
	$CollisionShape3D.disabled = true
	visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
