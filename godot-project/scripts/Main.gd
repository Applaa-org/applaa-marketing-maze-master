extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var score_label: Label = $UI/ScoreLabel
@onready var keys_label: Label = $UI/KeysLabel
@onready var instructions_label: Label = $UI/InstructionsLabel

func _ready() -> void:
	# Set up UI
	score_label.text = "Insights: %d" % Global.score
	keys_label.text = "Keys: %d" % Global.behavior_keys
	instructions_label.text = "WASD: Move | Space: Jump | Collect insights, avoid red traps!"

func _process(delta: float) -> void:
	# Update UI
	score_label.text = "Insights: %d" % Global.score
	keys_label.text = "Keys: %d" % Global.behavior_keys