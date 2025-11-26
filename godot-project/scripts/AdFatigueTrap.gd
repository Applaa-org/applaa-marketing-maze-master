extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	# Set up appearance
	sprite.modulate = Color.RED
	body_entered.connect(_on_body_entered)
	
	# Pulsing danger animation
	var tween = create_tween()
	tween.set_loops(true)
	tween.tween_property(sprite, "modulate:a", 0.5, 0.5)
	tween.tween_property(sprite, "modulate:a", 1.0, 0.5)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.hit_ad_fatigue()