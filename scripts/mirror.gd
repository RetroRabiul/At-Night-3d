extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		var reflection_mat:StandardMaterial3D = %Reflection.get_surface_override_material(0)
		var mirror_in = create_tween()
		mirror_in.tween_property(reflection_mat, "albedo_color:a", 1.0, 0.5)


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		var reflection_mat:StandardMaterial3D = %Reflection.get_surface_override_material(0)
		var mirror_in = create_tween()
		mirror_in.tween_property(reflection_mat, "albedo_color:a", 0.0, 0.5)
