extends CharacterBody2D
class_name enemy

@onready var leftray: RayCast2D = $leftray
@onready var rightray: RayCast2D = $rightray

@export var SPEED: float = 200.0
var direction: int = 1
 # ✅ Asegura que velocity es Vector2

func _physics_process(delta: float) -> void:
	# Aplicar gravedad correctamente
	if not is_on_floor():
		velocity.y += ProjectSettings.get_setting("physics/2d/default_gravity") * delta

	# Detección de rayos para patrullaje
	if direction == 1 and not rightray.is_colliding():
		direction = -1
	elif direction == -1 and not leftray.is_colliding():
		direction = 1

	# Movimiento horizontal
	velocity.x = direction * SPEED

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.damage(1)
