extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	# Create a simple red square as trap sprite
	if sprite:
		if not sprite.texture:
			var texture = ImageTexture.new()
			var image = Image.create(40, 40, false, Image.FORMAT_RGB8)
			image.fill(Color.RED)
			texture.set_image(image)
			sprite.texture = texture
	
	body_entered.connect(_on_body_entered)
	
	# Pulsing danger animation
	if sprite:
		var tween = create_tween()
		tween.set_loops(true)
		tween.tween_property(sprite, "modulate:a", 0.5, 0.5)
		tween.tween_property(sprite, "modulate:a", 1.0, 0.5)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		if body.has_method("hit_ad_fatigue"):
			body.hit_ad_fatigue()