extends Node2D

var rotation_speed: int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Logo.rotation_degrees += rotation_speed * delta
	
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 180
		rotation_speed = 0
