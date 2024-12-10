extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignal.fuse_box.connect(_fuse_box)

func _fuse_box(state):
	if state == true:
		%AnimationPlayer.play("Open")
		GlobalVar.fuse_box_opened = true
		print("door Opened")
	elif state == false:
		%AnimationPlayer.play("Close")
		GlobalVar.fuse_box_opened = false
		print("door Closed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
