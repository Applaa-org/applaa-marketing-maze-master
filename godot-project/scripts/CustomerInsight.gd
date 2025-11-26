extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	# Create a simple green circle as insight sprite
	if not sprite.texture:
		var texture = ImageTexture.new()
		var image = Image.create(30, 30, false, Image.FORMAT_RGBA8)
		image.fill(Color.TRANSPARENT)
		# Draw a green circle
		for x in range(30):
			for y in range(30):
				var dist = Vector2(x - 15, y - 15).length()
				if dist <= 15:
					image.set_pixel(x, y, Color.GREEN)
		texture.set_image(image)
		sprite.texture = texture
	
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