extends CharacterBody3D


const SPEED = 2.0
const JUMP_VELOCITY = 4.5

const SENSITIVITY = 0.0008

var mouse_mode = true

@onready var camera = %Camera
@onready var use_ray = %UseRayCast
@onready var hud = $HUD


func _ready():
	%torch.visible = false
	GlobalSignal.set_narrative.emit(GlobalVar.starting_text)
	GlobalSignal.hide_torch.connect(_hide_torch)
	#GlobalSignal.set_narrative.emit(GlobalVar.collect_torch)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_mode = false


func _hide_torch():
	%torch.visible = false

func _input(event):
	if event is InputEventMouseMotion and !mouse_mode:
		rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))

	if Input.is_action_just_pressed("ui_cancel"):
		if mouse_mode:
			mouse_mode = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			mouse_mode = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.is_action_just_pressed("use"):
		if use_ray.is_colliding():
			if use_ray.get_collider().is_in_group("pick_up"):
				print (use_ray.get_collider().name)
				GlobalSignal.torch_collected.emit()
				%torch.visible = true
				#_pick_up_item(use_ray.get_collider())
			if use_ray.get_collider().is_in_group("drink"):
				GlobalSignal.drink.emit()
			if use_ray.get_collider().is_in_group("eat"):
				GlobalSignal.eat.emit()
			if use_ray.get_collider().is_in_group("fuse_box"):
				if GlobalVar.fuse_box_opened == false:
					#GlobalVar.fuse_box_opened = true
					print(GlobalVar.fuse_box_opened)
					GlobalSignal.fuse_box.emit(true)
				elif GlobalVar.fuse_box_opened == true:
					#GlobalVar.fuse_box_opened = false
					print(GlobalVar.fuse_box_opened)
					GlobalSignal.fuse_box.emit(false)
			if use_ray.get_collider().is_in_group("old_fuse"):
				GlobalSignal.old_fuse.emit()
			if use_ray.get_collider().is_in_group("drower"):
				GlobalSignal.drower.emit()
			if use_ray.get_collider().is_in_group("key"):
				GlobalSignal.key.emit()
			if use_ray.get_collider().is_in_group("trap"):
				GlobalSignal.trap.emit()
			if use_ray.get_collider().is_in_group("new_fuse"):
				GlobalSignal.new_fuse.emit()
			if use_ray.get_collider().is_in_group("bed"):
				GlobalSignal.sleep.emit()
	


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	_check_ray()

func _check_ray():
	if use_ray.is_colliding():
		if use_ray.get_collider().is_in_group("highlight"):
			hud.target_state(true)
		else:
			hud.target_state(false)
	else:
		hud.target_state(false)
