extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.trap.connect(_trap_state)

func _trap_state():
	if GlobalVar.ket_collected == true:
		if GlobalVar.trap_opened == false:
			%AnimationPlayer.play("open")
			GlobalVar.trap_opened = true
		elif GlobalVar.trap_opened == true:
			%AnimationPlayer.play("close")
			GlobalVar.trap_opened = false
	else:
		GlobalSignal.set_achievement.emit(GlobalVar.locked_text)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
