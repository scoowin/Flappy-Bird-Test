extends KinematicBody2D

const FLOOR_NORMAL = Vector2.UP
var velocity: = Vector2.ZERO

var speed: = 200
var gravity: = 20
var is_alive: = true

func _ready() -> void:
	velocity.x = speed
	velocity.y = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump"):
		velocity.y = -500

func die() -> void:
	is_alive = false
	$AnimatedSprite.playing = false

func _physics_process(delta: float) -> void:
	if is_alive == true:
		$AnimatedSprite.play("default")
		velocity = move_and_slide(velocity, FLOOR_NORMAL)
		velocity.y += gravity
		if self.position.y > 1700:
			die()
