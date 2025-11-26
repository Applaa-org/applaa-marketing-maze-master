extends Control

@onready var title_label: Label = $VBoxContainer/TitleLabel
@onready var score_label: Label = $VBoxContainer/ScoreLabel
@onready var message_label: Label = $VBoxContainer/MessageLabel
@onready var restart_button: Button = $VBoxContainer/RestartButton
@onready var menu_button: Button = $VBoxContainer/MenuButton
@onready var close_button: Button = $VBoxContainer/CloseButton

func _ready() -> void:
	# Set up victory message
	title_label.text = "Marketing Mastery Achieved!"
	score_label.text = "Final Score: %d Insights" % Global.score
	message_label.text = "You've successfully navigated the consumer psychology maze and mastered the art of marketing!"
	
	# Connect buttons
	restart_button.pressed.connect(_on_restart_pressed)
	menu_button.pressed.connect(_on_menu_pressed)
	close_button.pressed.connect(_on_close_pressed)

func _on_restart_pressed() -> void:
	Global.reset_score()
	Global.behavior_keys = 0
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_menu_pressed() -> void:
	Global.reset_score()
	Global.behavior_keys = 0
	get_tree().change_scene_to_file("res://scenes/StartScreen.tscn")

func _on_close_pressed() -> void:
	get_tree().quit()