extends CharacterBody3D

const SPEED = 4.0
var hero
@export var turn_speed = 4.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var chasing : bool = false

func _ready() -> void:
	$zombie2/AnimationPlayer.play("Chasing")
	$ZombieCollision.disabled = true
	%PlayerDieCollision.disabled = true
	hero = get_tree().get_nodes_in_group("player")[0]
	$ChaseTimer.start()
	await get_tree().create_timer(1.0).timeout
	chasing = true
	GlobalSignal.zombie_trapped.connect(_zombie_trapped)
	GlobalSignal.show_zombie.connect(_show_zombie)


func _zombie_trapped():
	#$CollisionShape3D.disabled = true
	GlobalVar.zombie_trapped = true


func _show_zombie():
	visible = true
	$ZombieCollision.set_deferred("disabled", false)
	%PlayerDieCollision.set_deferred("disabled", false)
	$ZombieSound.play()
	$FootDraggingSound.play()


func _move_towards(delta):
	var targetPos = $NavigationAgent3D.get_next_path_position()
	var direction = global_position.direction_to(targetPos)
	
	rotation.y=lerp_angle(rotation.y,atan2(-velocity.x,-velocity.z),.1)
	velocity = (direction * SPEED).normalized()
	
	if not is_on_floor():
		velocity.y -= gravity
	
	move_and_slide()

func _physics_process(delta: float) -> void:
	if !chasing: return
	if GlobalVar.start_zombie_chase:
		_move_towards(delta)

func _on_chase_timer_timeout() -> void:
	$NavigationAgent3D.set_target_position(hero.global_position)


func _on_player_die_area_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		call_deferred("_change_scene")
		
func _change_scene():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
