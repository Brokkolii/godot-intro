extends CharacterBody2D

const speed: int = 500

var can_laser: bool = true
signal laser_fired(pos, dir)

var can_grenade: bool = true
signal grenade_thrown(pos, dir)

func _process(_delta):
	
	# movement input
	var direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * speed
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())

	var player_direction = (get_global_mouse_position() - position).normalized()
	# laser input
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers.pick_random()
		laser_fired.emit(selected_laser.global_position, player_direction)
		can_laser = false
		$CanLaserTimer.start()
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		var grenade_markers = $GrenadeStartPosition.get_children()
		var selected_grenade = grenade_markers.pick_random()
		
		grenade_thrown.emit(selected_grenade.global_position, player_direction)
		can_grenade = false
		$CanGrenadeTimer.start()
		
func _on_can_laser_timer_timeout():
	can_laser = true

func _on_can_grenade_timer_timeout():
	can_grenade = true
