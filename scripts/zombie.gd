extends CharacterBody3D


const SPEED = 100.0
var hero
@export var turn_speed = 4.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var chasing : bool = false


func _ready() -> void:
	hero = get_tree().get_nodes_in_group("player")[0]
	$ChaseTimer.start()
	await get_tree().create_timer(1.0).timeout
	chasing = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	if !chasing: return
	$FaceDirection.look_at(hero.global_transform.origin, Vector3.UP)
	rotate_y(deg_to_rad($FaceDirection.rotation.y * turn_speed))
	
	velocity = ($NavigationAgent3D.get_next_path_position() - transform.origin).normalized() * SPEED * delta 
	
	move_and_slide()

func _on_chase_timer_timeout() -> void:
	$NavigationAgent3D.set_target_position(hero.global_transform.origin)
