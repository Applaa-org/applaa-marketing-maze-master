extends Control

@onready var title_label: Label = $VBoxContainer/TitleLabel
@onready var instructions_label: Label = $VBoxContainer/InstructionsLabel
@onready var start_button: Button = $VBoxContainer/StartButton
@onready var close_button: Button = $VBoxContainer/CloseButton

func _ready() -> void:
	# Set up title and instructions
	title_label.text = "Marketing Maze Master"
	instructions_label.text = """
Navigate the brain-shaped maze of consumer psychology!

CONTROLS:
• WASD or Arrow Keys - Move through the maze
• Spacebar - Jump over obstacles
• ESC - Pause game

OBJECTIVES:
• Collect GREEN Customer Insights for points
• Find GOLD Behavior Keys to unlock doors
• Avoid RED Ad Fatigue Traps (instant defeat!)
• Unlock PURPLE A/B Test Doors and ORANGE Target Audience Locks
• Reach the WHITE goal to achieve Marketing Mastery!

TIPS:
• Plan your route carefully - some paths require keys
• Watch out for pulsing red traps
• Collect all insights for maximum score
	"""
	
	# Connect buttons
	start_button.pressed.connect(_on_start_pressed)
	close_button.pressed.connect(_on_close_pressed)

func _on_start_pressed() -> void:
	Global.reset_score()
	Global.behavior_keys = 0
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_close_pressed() -> void:
	get_tree().quit()