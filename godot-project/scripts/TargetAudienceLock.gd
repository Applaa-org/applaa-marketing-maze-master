extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label

var is_locked: bool = true

func _ready() -> void:
	sprite.modulate = Color.ORANGE
	label.text = "Target Audience\nNeed Key"
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player" and is_locked:
		if Global.behavior_keys > 0:
			# Unlock the door
			Global.behavior_keys -= 1
			is_locked = false
			sprite.modulate = Color.GREEN
			label.text = "Target Audience\nUnlocked!"
			collision_shape.set_deferred("disabled", true)
			
			# Remove after delay
			await get_tree().create_timer(1.0).timeout
			queue_free()