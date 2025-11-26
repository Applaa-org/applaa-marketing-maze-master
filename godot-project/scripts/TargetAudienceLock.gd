extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var label: Label = $Label

var is_locked: bool = true

func _ready() -> void:
	# Create a simple orange rectangle as lock sprite
	if sprite:
		if not sprite.texture:
			var texture = ImageTexture.new()
			var image = Image.create(50, 80, false, Image.FORMAT_RGB8)
			image.fill(Color.ORANGE)
			texture.set_image(image)
			sprite.texture = texture
	
	if label:
		label.text = "Target Audience\nNeed Key"
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.name == "Player" and is_locked:
		if Global and Global.behavior_keys > 0:
			# Unlock the door
			Global.behavior_keys -= 1
			is_locked = false
			if sprite:
				sprite.modulate = Color.GREEN
			if label:
				label.text = "Target Audience\nUnlocked!"
			if collision_shape:
				collision_shape.set_deferred("disabled", true)
			
			# Remove after delay
			await get_tree().create_timer(1.0).timeout
			queue_free()