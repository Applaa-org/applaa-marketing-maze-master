extends CharacterBody2D

const SPEED: float = 150.0
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	# Create a simple colored rectangle as player sprite
	if not sprite.texture:
		var texture = ImageTexture.new()
		var image = Image.create(30, 30, false, Image.FORMAT_RGB8)
		image.fill(Color.CYAN)
		texture.set_image(image)
		sprite.texture = texture

func _physics_process(delta: float) -> void:
	# Apply gravity (for potential vertical sections)
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Jump functionality (for navigating maze obstacles)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -300.0
	
	move_and_slide()

func collect_insight() -> void:
	Global.add_score(25)
	# Visual feedback
	var tween = create_tween()
	tween.tween_property(sprite, "modulate", Color.YELLOW, 0.2)
	tween.tween_property(sprite, "modulate", Color.CYAN, 0.2)

func hit_ad_fatigue() -> void:
	# Player hit an ad fatigue trap
	get_tree().change_scene_to_file("res://scenes/DefeatScreen.tscn")