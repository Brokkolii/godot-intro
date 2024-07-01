extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 100
var s: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300,200)
	position = pos

	# s = 2
	# scale = Vector2(s, s)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x += speed * delta
	position = pos
	
	# s += 0.01
	# scale = Vector2(s,s)
