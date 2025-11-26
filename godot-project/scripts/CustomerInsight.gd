extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	# Set up appearance
	sprite.modulate = Color.GREEN
	body_entered.connect(_on_body_entered)
	
	# Floating animation
	var tween = create_tween()
	tween.set_loops(true)
	tween.tween_property(self, "position:y", position.y - 10, 1.0)
	tween.tween_property(self, "position:y", position.y + 10, 1.0)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.collect_insight()
		queue_free()