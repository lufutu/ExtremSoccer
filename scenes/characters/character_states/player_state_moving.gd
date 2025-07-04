class_name PlayerStateMoving
extends PlayerState

func _process(_delta: float) -> void:
	if player.control_scheme == Player.ControlScheme.CPU:
		pass # proccess AI movement
	else:
		handle_human_movement()
	set_movement_animation()
	player.set_heading()
	
func handle_human_movement() -> void:
	var direction := KeyUtils.get_input_vector(player.control_scheme)	
	player.velocity = direction * player.speed
	
	if player.velocity != Vector2.ZERO and KeyUtils.is_action_just_pressed(player.control_scheme, KeyUtils.Action.SHOOT):
		state_transition_requested.emit(Player.State.TACKLING)

func set_movement_animation() -> void:
	if player.velocity.length() > 0:
		animation_player.play("run")
	else:
		animation_player.play("idle")	
	
