extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.drower.connect(_drower)

func _drower():
	if GlobalVar.drower_opened == false:
		GlobalVar.drower_opened = true
		print(GlobalVar.drower_opened)
		%AnimationPlayer.play("open_drower")
	elif GlobalVar.drower_opened == true:
		GlobalVar.drower_opened = false
		print(GlobalVar.drower_opened)
		%AnimationPlayer.play("close_drower")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
