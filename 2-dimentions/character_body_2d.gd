extends CharacterBody2D
class_name Player
var normal_speedd
var SPEED = 300.0
var JUMP_VELOCITY = -400.0
var has_key = true
var life = 5

func _process(delta: float) -> void:
	die()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	if life <=0:
		get_tree().reload_current_scene()


func damage(cantidad):
	self.life -= cantidad
	self.velocity.y += 10
