extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	# Set up appearance
	sprite.modulate = Color.GOLD
	body_entered.connect(_on_body_entered)
	
	# Spinning animation
	var tween = create_tween()
	tween.set_loops(true)
	tween.tween_property(self, "rotation", TAU, 2.0)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.behavior_keys += 1
		queue_free()