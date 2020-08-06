extends Node2D

var s
var n = [null,null,null,null,null,null,null,null]
var i
var j
var space
var r
var distance

var score

func _ready() -> void:
	s = load("res://Src/Pipe/Pipe.tscn")
	score = 0
	i=0
	j=0
	space = 350
	distance = 450
	r = RandomNumberGenerator.new()
	r.randomize()
	
	n[i] = s.instance()
	add_child(n[i])
	var x = r.randf_range((100 + space + 1664)/2, 1614.0)
	var size = 2*(1664 - x)
	n[i].scale.y = size/320
	n[i].position.y = x
	n[i].position.x = 900
	
	n[i+1] = s.instance()
	add_child(n[i+1])
	n[i+1].get_child(0).flip_v = true
	x = 1664 - size - space
	x /= 2
	size = 2*x
	n[i+1].scale.y = size/320
	n[i+1].position.y = x
	n[i+1].position.x = n[i].position.x
	
	new_pipe()
	new_pipe()
	new_pipe()
	new_pipe()
	new_pipe()
	new_pipe()
	new_pipe()

func new_pipe() -> void:
	var y = i
	if i == 6:
		i = 0
	else:
		i += 2
	n[i] = s.instance()
	add_child(n[i])
	var x = r.randf_range((100 + space + 1664)/2, 1614.0)
	var size = 2*(1664 - x)
	n[i].scale.y = size/320
	n[i].position.y = x
	n[i].position.x = n[y].position.x + distance
	
	n[i+1] = s.instance()
	add_child(n[i+1])
	n[i+1].get_child(0).flip_v = true
	x = 1664 - size - space
	x /= 2
	size = 2*x
	n[i+1].scale.y = size/320
	n[i+1].position.y = x
	n[i+1].position.x = n[i].position.x

func del_pipe() -> void:
	remove_child(n[j])
	remove_child(n[j+1])
	if j == 6:
		j = 0
	else:
		j += 2
	new_pipe()

func _on_Area2D_body_entered(body: Node) -> void:
	kill()

func kill() -> void:
	$Player.die()

func _physics_process(delta: float) -> void:
	if n[j].position.x < $Player.position.x - 352:
		del_pipe()
