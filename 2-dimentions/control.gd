extends CanvasLayer

@onready var life_indicators := [
	$ColorRect,
	$ColorRect2,
	$ColorRect3,
	$ColorRect4,
	$ColorRect5
]

@onready var player: Player =$".."

func _process(delta: float) -> void:
	update_life_display()

func update_life_display():
	if not player:
		return

	for i in life_indicators.size():
		life_indicators[i].visible = i < player.life
