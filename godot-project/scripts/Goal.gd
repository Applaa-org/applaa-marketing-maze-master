extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label

func _ready() -> void:
	sprite.modulate = Color.WHITE
	label.text = "Marketing Mastery\nReached!"
	body_entered.connect(_on_body_entered)
	
	# Victory glow animation
	var tween = create_tween()
	tween.set_loops(true)
	tween.tween_property(sprite, "modulate:a", 0.7, 1.0)
	tween.tween_property(sprite, "modulate:a", 1.0, 1.0)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/VictoryScreen.tscn")