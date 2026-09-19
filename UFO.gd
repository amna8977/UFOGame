extends Area2D

var direction
var speed
var width
var height

func _ready():
	position = get_viewport_rect().size / 2
	direction = Vector2()
	speed = 100
	direction.x = rand_range(-1,1)
	direction.y = rand_range(-1,1)
	direction = direction.normalized()
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	
func _process(delta):
	position += direction * speed * delta
	if position.x < 0 or position.x > width:
		direction.x *= -1
	position += direction * speed * delta
	if position.y < 0 or position.y > height:
		direction.y *= -1

func _on_UFO_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		direction.x = rand_range(-1,1)
		direction.y = rand_range(-1,1)
		direction = direction.normalized()
		position.x = rand_range(0,width)
		position.y = rand_range(0,height)
		speed += 5
		var newBombPath = load("res://Bomb.tscn")
		var newBomb = newBombPath.instance()
		get_parent().add_child(newBomb)
		newBomb.speed += 10