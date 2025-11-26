extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label

func _ready() -> void:
	# Create a simple white circle as goal sprite
	if not sprite.texture:
		var texture = ImageTexture.new()
		var image = Image.create(60, 60, false, Image.FORMAT_RGBA8)
		image.fill(Color.TRANSPARENT)
		# Draw a white circle
		for x in range(60):
			for y in range(60):
				var dist = Vector2(x - 30, y - 30).length()
				if dist <= 30:
					image.set_pixel(x, y, Color.WHITE)
		texture.set_image(image)
		sprite.texture = texture
	
	label.text = "GOAL"
	body_entered.connect(_on_body_entered)
	
	# Victory glow animation
	var tween = create_tween()
	tween.set_loops(true)
	tween.tween_property(sprite, "modulate:a", 0.7, 1.0)
	tween.tween_property(sprite, "modulate:a", 1.0, 1.0)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/VictoryScreen.tscn")