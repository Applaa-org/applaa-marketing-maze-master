extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var score_label: Label = $UI/ScoreLabel
@onready var keys_label: Label = $UI/KeysLabel
@onready var instructions_label: Label = $UI/InstructionsLabel

func _ready() -> void:
	# Set up UI
	update_ui()

func _process(delta: float) -> void:
	# Update UI
	update_ui()

func update_ui() -> void:
	if score_label:
		score_label.text = "Insights: %d" % Global.score
	if keys_label:
		keys_label.text = "Keys: %d" % Global.behavior_keys